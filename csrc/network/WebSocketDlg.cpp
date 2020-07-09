#include "WebSocketDlg.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "Utility.h"
#include "xxtea/xxtea.h"

//xxtea 加密串
#define XXTEA_KEY "a4b1a4d6fa671a7e89687326211d5b25"
#define OPEN_XXTEA 1


CWebSocketDlg* CWebSocketDlg::s_pInstance = nullptr;

CWebSocketDlg::CWebSocketDlg()
	:m_iDataCBHandler(0)
	, m_bPushSwitch(false)
	, m_pSocket(nullptr)
	, m_iPort(0)
	, m_bNeedClose(false)
	, m_iStateCBHandler(0)
{
}


CWebSocketDlg::~CWebSocketDlg()
{
	s_pInstance = nullptr;

	//关闭Update
	Director::getInstance()->getScheduler()->unscheduleUpdate(this);

	if (m_pSocket){
		//关闭之前连接
		if (cocos2d::network::WebSocket::State::OPEN == m_pSocket->getReadyState())
			Close();

		//销毁websocket对象
		delete m_pSocket;
		m_pSocket = nullptr;
	}
	return;
}

//获取实例接口
CWebSocketDlg* CWebSocketDlg::GetInstance()
{
	if (!s_pInstance)
	{
		s_pInstance = CWebSocketDlg::create();
		s_pInstance->retain();
	}
	return s_pInstance;
}

CWebSocketDlg* CWebSocketDlg::create()
{
	CWebSocketDlg* pDlg = new CWebSocketDlg();
	if (pDlg&& pDlg->init()){
		pDlg->autorelease();
		return pDlg;
	}
	CC_SAFE_DELETE(pDlg);
	return nullptr;
}

//注册Lua数据回调函数
//@ iCBHandler:lua函数句柄
//Lua函数原型: function(strHeadData, iHeadLen, strBodyData, iBodyLen);
//strHeadData:包头数据
//iHeadLen:包头数据长度
//strBodyData:包体数据
//iBodyLen:包体数据长度
void CWebSocketDlg::RegDataCallBack(int iCBHandler)
{
	m_iDataCBHandler = iCBHandler;
	return;
}

//注册状态回调函数
//# iCBHandler:lua函数句柄
//Lua函数原型: function(iState);
//iState:socket状态码 WS_XXXXX 常量
void CWebSocketDlg::RegStateCallBack(int iCBHandler)
{
	m_iStateCBHandler = iCBHandler;
	return;
}

//删除回调函数
void CWebSocketDlg::RemoveAllCallBack()
{
	//清空所有回调句柄
	m_iStateCBHandler = 0;
	m_iDataCBHandler = 0;
	return;
}

//设置数据推送状态
//@ bState: true:开启数据推送  false:关闭数据推送
void CWebSocketDlg::SetDataPushState(bool bState)
{
	m_bPushSwitch = bState;
	return;
}

//初始化连接
//@ strHost:连接地址
//@ iPort:端口号
void CWebSocketDlg::InitSocket(const string& strHost, int iPort)
{
	//保存链接地址和端口号
	m_strHost = strHost;
	m_iPort = iPort;

	//之前没有创建websocket对象
	if (!m_pSocket)
		m_pSocket = new network::WebSocket();

	//连接服务器
	Connect();
	return;
}


//连接服务器
bool CWebSocketDlg::Connect()
{
	bool bRes = false;
	//之前连接没有断开
	if (WebSocket::State::OPEN == m_pSocket->getReadyState()){
		//关闭之前连接
		Close();
	}

	if (0 < m_strHost.length() && 0 < m_iPort&& m_pSocket){
		//主动断开标志复位
		m_bNeedClose = false;

		//拼装连接地址
		char szUrl[1024];
		memset(szUrl, 0, sizeof(szUrl));
		sprintf(szUrl, "ws://%s:%d", m_strHost.c_str(), m_iPort);

		//初始化websocket，并连接服务器
		m_pSocket->init(*this, szUrl);
		bRes = true;
	}

	return bRes;
}

//关闭服务器连接
void CWebSocketDlg::Close()
{
	//主动断开标志置位，防止onClose引发重连
	m_bNeedClose = true;
	if (m_pSocket)
		m_pSocket->close();
	return;
}

//延迟重连服务器
void CWebSocketDlg::OnReConnect()
{
	//重连服务器
	ReConnect();
	return;
}

//重连服务器
void CWebSocketDlg::ReConnect()
{
	//主动断开
	if (m_bNeedClose)
		return;

	//连接服务器
	Connect();
	return;
}

//获取连接状态
int CWebSocketDlg::GetSocketState()
{
	//没有初始化
	int iRet = WS_NONE_INIT;
	WebSocket::State eState = m_pSocket->getReadyState();
	if (WebSocket::State::CONNECTING == eState){       //连接中
		iRet = WS_CONNECTING;
	}
	else if (WebSocket::State::OPEN == eState){       //已连接
		iRet = WS_OPEN;
	}
	else if (WebSocket::State::CLOSING == eState){   //关闭中
		iRet = WS_CLOSEING;
	}
	else if (WebSocket::State::CLOSED == eState){    //已关闭
		iRet = WS_CLOSED;
	}

	return iRet;
}

//发送数据 
//(有可能出现Lua层传递的二进制数据被截断，待测试，可疑问题代码cocos库LuaBasicConversions.cpp ::luaval_to_std_string函数直接使用了string的构造没有带长度版本)
//@ pHead:包头数据
//@ iHeadLen:包头数据长度
//@ pBody:包体数据
//@ iBodyLen:包体数据长度
void CWebSocketDlg::SendMsg(const char* strHead, int iHeadLen, const char* strBody, int iBodyLen)
{
	//拼装发送数据
	unsigned char* pData = new unsigned char[2 + iHeadLen + iBodyLen];
	//填充包头长度
	int iOffset = 0;
	CUtility::Short2Byte(iHeadLen, pData, iOffset);
	//填充包头
	iOffset += 2;
	memmove(&pData[iOffset], strHead, iHeadLen);
	//填充包体
	iOffset += iHeadLen;
	memmove(&pData[iOffset], strBody, iBodyLen);

	//发送数据
	sendMsg(pData, 2 + iHeadLen + iBodyLen);

	delete[] pData;
	return;
}

void CWebSocketDlg::sendCacheMsg(CWSDataBuffer::DataInfo info)
{
	sendMsg(info.srcData, info.dataLen);
	CC_SAFE_DELETE_ARRAY(info.srcData);
}

void CWebSocketDlg::sendMsg(unsigned char* msg, unsigned int len)
{
	if (WebSocket::State::OPEN != m_pSocket->getReadyState()){
		//连接未创建好
		m_sendDataBuffer.PushData(msg, len);
		return;
	}

#ifdef OPEN_XXTEA
	//加密
	unsigned char* pData = new unsigned char[len];
	memmove(pData, msg, len);
	xxtea_long lLen = 0;
	xxtea_long lKeyLen = strlen(XXTEA_KEY);
	unsigned char* pKey = new unsigned char[lKeyLen];
	memmove(pKey, XXTEA_KEY, lKeyLen);
	unsigned char* pSendData = ::xxtea_encrypt(pData, len, pKey, lKeyLen, &lLen);

	m_pSocket->send(pSendData, lLen);

	delete[] pData;
	if (pSendData){
		free(pSendData);
	}
#else
	m_pSocket->send(msg, len);
#endif
}

//通知lua层socket状态变更
void CWebSocketDlg::SocketStateToLua(int iState)
{
	//已经注册Lua状态回调函数
	if (0 != m_iStateCBHandler){
		//推送socket状态给lua层
		LuaEngine* pEngine = LuaEngine::getInstance();
		LuaStack* pStack = pEngine->getLuaStack();

		pStack->pushInt(iState);
		pStack->executeFunctionByHandler(m_iStateCBHandler, 1);
		pStack->clean();
	}
	return;
}

//连接创建成功
void CWebSocketDlg::onOpen(WebSocket* ws)
{
	//通知Lua层连接状态变更
	SocketStateToLua(WS_OPEN);
	return;
}

//收到数据
void CWebSocketDlg::onMessage(WebSocket* ws, const WebSocket::Data& data)
{
	printf("Receiving data:---delegate onMessage! \n");
	unsigned char* srcData = nullptr;
#ifdef OPEN_XXTEA
	char *pData = data.bytes;
	int srcLen = data.len;
	unsigned char* pSrcData = new unsigned char[srcLen];
	memmove(pSrcData, pData, srcLen);

	//解密
	xxtea_long lLen = 0;

	xxtea_long lKeyLen = strlen(XXTEA_KEY);
	unsigned char* pKey = new unsigned char[lKeyLen];
	memmove(pKey, XXTEA_KEY, lKeyLen);

	srcData = ::xxtea_decrypt(pSrcData, srcLen, pKey, lKeyLen, &lLen);
	srcLen = lLen;
#else
	char *pData = data.bytes;
	int srcLen = data.len;
	srcData = new unsigned char[srcLen];
	memmove(srcData, pData, srcLen);
#endif


	//将数据压入数据队列
	m_receiveDataBuffer.PushData(srcData,srcLen);

#ifdef OPEN_XXTEA
	delete[] pSrcData;
	if (srcData){
		free(srcData);
	}
#endif
	return;
}

//连接断开
void CWebSocketDlg::onClose(WebSocket* ws)
{
	//主动断开
	if (m_bNeedClose)
		return;

	//通知Lua层连接状态变更
	
	this->stopAllActions();
	//1秒钟后重连服务器
//	DelayTime* pDT = DelayTime::create(1.0);
//	CallFunc* pCF = CallFunc::create(CC_CALLBACK_0(CWebSocketDlg::OnReConnect, this));
//	Sequence* pAc = Sequence::create(pDT, pCF, nullptr);
//	runAction(pAc);
    
    SocketStateToLua(WS_CLOSED);
	return;
}

//连接服务器出错
void CWebSocketDlg::onError(WebSocket* ws, const WebSocket::ErrorCode& error)
{
	//解析错误码
	int iErrorCode = WS_UNKNOWN_ERROR;
	if (WebSocket::ErrorCode::TIME_OUT == error){
		iErrorCode = WS_TIME_OUT;
	}
	else if (WebSocket::ErrorCode::CONNECTION_FAILURE == error){
		iErrorCode = WS_CONNECTION_FAILURE;
	}

	//将错误码传给Lua
	SocketStateToLua(iErrorCode);
	return;
}

bool CWebSocketDlg::init()
{
	bool bRet = false;
	if (Node::init()){
		//开启Update回调
		Director::getInstance()->getScheduler()->scheduleUpdate(this, 0, false);

		bRet = true;
	}
	return bRet;
}

//推送数据到Lua层
void CWebSocketDlg::PushDataToLua(CWSDataBuffer::DataInfo info)
{
	//注册了Lua数据推送函数
	if (0 != m_iDataCBHandler){
		//提取二进制数据
		int iDataLen = info.dataLen;

		//提取前两字节，拼装包头长度
		int iOffset = 0;
		int iHeadLen = CUtility::Byte2Short(info.srcData, iOffset);

		//包头数据
		iOffset += 2;
		char* pHead = new char[iHeadLen];
		memmove(pHead, info.srcData + iOffset, iHeadLen);

		//包体数据
		iOffset += iHeadLen;
		int iBodyLen = iDataLen - iHeadLen - 2;
		char* pBody = new char[iBodyLen];
		memmove(pBody, info.srcData + iOffset, iBodyLen);

		LuaEngine* pEngin = LuaEngine::getInstance();
		LuaStack* pStack = pEngin->getLuaStack();

		//包头数据压入Lua栈
		pStack->pushString(pHead, iHeadLen);
		//包头长度压入Lua栈
		pStack->pushInt(iHeadLen);
		//包体数据压入Lua栈
		pStack->pushString(pBody, iBodyLen);
		//包体长度压入Lua栈
		pStack->pushInt(iBodyLen);

		pStack->executeFunctionByHandler(m_iDataCBHandler, 4);
		pStack->clean();


		CC_SAFE_DELETE_ARRAY(pHead);
		CC_SAFE_DELETE_ARRAY(pBody);
		CC_SAFE_DELETE_ARRAY(info.srcData);
	}
	return;
}

void CWebSocketDlg::update(float dt)
{
	int iBufSize = m_receiveDataBuffer.GetBufferSize();
	//数据推送开关以打开 且 有数据
	if (m_bPushSwitch && iBufSize>0){
		//注册过Lua数据推送函数
		if (0 != m_iDataCBHandler)
		{
			//提取buffer中第一个数据包
			PushDataToLua(m_receiveDataBuffer.GetData());
		}
	}

	if (WebSocket::State::OPEN == m_pSocket->getReadyState()){
		//连接未创建好
		if (m_sendDataBuffer.GetBufferSize()>0)
		{
			sendCacheMsg(m_sendDataBuffer.GetData());
		}
	}
}



