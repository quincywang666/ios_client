#include "WebSocketDlg.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "Utility.h"
#include "xxtea/xxtea.h"

//xxtea ���ܴ�
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

	//�ر�Update
	Director::getInstance()->getScheduler()->unscheduleUpdate(this);

	if (m_pSocket){
		//�ر�֮ǰ����
		if (cocos2d::network::WebSocket::State::OPEN == m_pSocket->getReadyState())
			Close();

		//����websocket����
		delete m_pSocket;
		m_pSocket = nullptr;
	}
	return;
}

//��ȡʵ���ӿ�
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

//ע��Lua���ݻص�����
//@ iCBHandler:lua�������
//Lua����ԭ��: function(strHeadData, iHeadLen, strBodyData, iBodyLen);
//strHeadData:��ͷ����
//iHeadLen:��ͷ���ݳ���
//strBodyData:��������
//iBodyLen:�������ݳ���
void CWebSocketDlg::RegDataCallBack(int iCBHandler)
{
	m_iDataCBHandler = iCBHandler;
	return;
}

//ע��״̬�ص�����
//# iCBHandler:lua�������
//Lua����ԭ��: function(iState);
//iState:socket״̬�� WS_XXXXX ����
void CWebSocketDlg::RegStateCallBack(int iCBHandler)
{
	m_iStateCBHandler = iCBHandler;
	return;
}

//ɾ���ص�����
void CWebSocketDlg::RemoveAllCallBack()
{
	//������лص����
	m_iStateCBHandler = 0;
	m_iDataCBHandler = 0;
	return;
}

//������������״̬
//@ bState: true:������������  false:�ر���������
void CWebSocketDlg::SetDataPushState(bool bState)
{
	m_bPushSwitch = bState;
	return;
}

//��ʼ������
//@ strHost:���ӵ�ַ
//@ iPort:�˿ں�
void CWebSocketDlg::InitSocket(const string& strHost, int iPort)
{
	//�������ӵ�ַ�Ͷ˿ں�
	m_strHost = strHost;
	m_iPort = iPort;

	//֮ǰû�д���websocket����
	if (!m_pSocket)
		m_pSocket = new network::WebSocket();

	//���ӷ�����
	Connect();
	return;
}


//���ӷ�����
bool CWebSocketDlg::Connect()
{
	bool bRes = false;
	//֮ǰ����û�жϿ�
	if (WebSocket::State::OPEN == m_pSocket->getReadyState()){
		//�ر�֮ǰ����
		Close();
	}

	if (0 < m_strHost.length() && 0 < m_iPort&& m_pSocket){
		//�����Ͽ���־��λ
		m_bNeedClose = false;

		//ƴװ���ӵ�ַ
		char szUrl[1024];
		memset(szUrl, 0, sizeof(szUrl));
		sprintf(szUrl, "ws://%s:%d", m_strHost.c_str(), m_iPort);

		//��ʼ��websocket�������ӷ�����
		m_pSocket->init(*this, szUrl);
		bRes = true;
	}

	return bRes;
}

//�رշ���������
void CWebSocketDlg::Close()
{
	//�����Ͽ���־��λ����ֹonClose��������
	m_bNeedClose = true;
	if (m_pSocket)
		m_pSocket->close();
	return;
}

//�ӳ�����������
void CWebSocketDlg::OnReConnect()
{
	//����������
	ReConnect();
	return;
}

//����������
void CWebSocketDlg::ReConnect()
{
	//�����Ͽ�
	if (m_bNeedClose)
		return;

	//���ӷ�����
	Connect();
	return;
}

//��ȡ����״̬
int CWebSocketDlg::GetSocketState()
{
	//û�г�ʼ��
	int iRet = WS_NONE_INIT;
	WebSocket::State eState = m_pSocket->getReadyState();
	if (WebSocket::State::CONNECTING == eState){       //������
		iRet = WS_CONNECTING;
	}
	else if (WebSocket::State::OPEN == eState){       //������
		iRet = WS_OPEN;
	}
	else if (WebSocket::State::CLOSING == eState){   //�ر���
		iRet = WS_CLOSEING;
	}
	else if (WebSocket::State::CLOSED == eState){    //�ѹر�
		iRet = WS_CLOSED;
	}

	return iRet;
}

//�������� 
//(�п��ܳ���Lua�㴫�ݵĶ��������ݱ��ضϣ������ԣ������������cocos��LuaBasicConversions.cpp ::luaval_to_std_string����ֱ��ʹ����string�Ĺ���û�д����Ȱ汾)
//@ pHead:��ͷ����
//@ iHeadLen:��ͷ���ݳ���
//@ pBody:��������
//@ iBodyLen:�������ݳ���
void CWebSocketDlg::SendMsg(const char* strHead, int iHeadLen, const char* strBody, int iBodyLen)
{
	//ƴװ��������
	unsigned char* pData = new unsigned char[2 + iHeadLen + iBodyLen];
	//����ͷ����
	int iOffset = 0;
	CUtility::Short2Byte(iHeadLen, pData, iOffset);
	//����ͷ
	iOffset += 2;
	memmove(&pData[iOffset], strHead, iHeadLen);
	//������
	iOffset += iHeadLen;
	memmove(&pData[iOffset], strBody, iBodyLen);

	//��������
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
		//����δ������
		m_sendDataBuffer.PushData(msg, len);
		return;
	}

#ifdef OPEN_XXTEA
	//����
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

//֪ͨlua��socket״̬���
void CWebSocketDlg::SocketStateToLua(int iState)
{
	//�Ѿ�ע��Lua״̬�ص�����
	if (0 != m_iStateCBHandler){
		//����socket״̬��lua��
		LuaEngine* pEngine = LuaEngine::getInstance();
		LuaStack* pStack = pEngine->getLuaStack();

		pStack->pushInt(iState);
		pStack->executeFunctionByHandler(m_iStateCBHandler, 1);
		pStack->clean();
	}
	return;
}

//���Ӵ����ɹ�
void CWebSocketDlg::onOpen(WebSocket* ws)
{
	//֪ͨLua������״̬���
	SocketStateToLua(WS_OPEN);
	return;
}

//�յ�����
void CWebSocketDlg::onMessage(WebSocket* ws, const WebSocket::Data& data)
{
	printf("Receiving data:---delegate onMessage! \n");
	unsigned char* srcData = nullptr;
#ifdef OPEN_XXTEA
	char *pData = data.bytes;
	int srcLen = data.len;
	unsigned char* pSrcData = new unsigned char[srcLen];
	memmove(pSrcData, pData, srcLen);

	//����
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


	//������ѹ�����ݶ���
	m_receiveDataBuffer.PushData(srcData,srcLen);

#ifdef OPEN_XXTEA
	delete[] pSrcData;
	if (srcData){
		free(srcData);
	}
#endif
	return;
}

//���ӶϿ�
void CWebSocketDlg::onClose(WebSocket* ws)
{
	//�����Ͽ�
	if (m_bNeedClose)
		return;

	//֪ͨLua������״̬���
	
	this->stopAllActions();
	//1���Ӻ�����������
//	DelayTime* pDT = DelayTime::create(1.0);
//	CallFunc* pCF = CallFunc::create(CC_CALLBACK_0(CWebSocketDlg::OnReConnect, this));
//	Sequence* pAc = Sequence::create(pDT, pCF, nullptr);
//	runAction(pAc);
    
    SocketStateToLua(WS_CLOSED);
	return;
}

//���ӷ���������
void CWebSocketDlg::onError(WebSocket* ws, const WebSocket::ErrorCode& error)
{
	//����������
	int iErrorCode = WS_UNKNOWN_ERROR;
	if (WebSocket::ErrorCode::TIME_OUT == error){
		iErrorCode = WS_TIME_OUT;
	}
	else if (WebSocket::ErrorCode::CONNECTION_FAILURE == error){
		iErrorCode = WS_CONNECTION_FAILURE;
	}

	//�������봫��Lua
	SocketStateToLua(iErrorCode);
	return;
}

bool CWebSocketDlg::init()
{
	bool bRet = false;
	if (Node::init()){
		//����Update�ص�
		Director::getInstance()->getScheduler()->scheduleUpdate(this, 0, false);

		bRet = true;
	}
	return bRet;
}

//�������ݵ�Lua��
void CWebSocketDlg::PushDataToLua(CWSDataBuffer::DataInfo info)
{
	//ע����Lua�������ͺ���
	if (0 != m_iDataCBHandler){
		//��ȡ����������
		int iDataLen = info.dataLen;

		//��ȡǰ���ֽڣ�ƴװ��ͷ����
		int iOffset = 0;
		int iHeadLen = CUtility::Byte2Short(info.srcData, iOffset);

		//��ͷ����
		iOffset += 2;
		char* pHead = new char[iHeadLen];
		memmove(pHead, info.srcData + iOffset, iHeadLen);

		//��������
		iOffset += iHeadLen;
		int iBodyLen = iDataLen - iHeadLen - 2;
		char* pBody = new char[iBodyLen];
		memmove(pBody, info.srcData + iOffset, iBodyLen);

		LuaEngine* pEngin = LuaEngine::getInstance();
		LuaStack* pStack = pEngin->getLuaStack();

		//��ͷ����ѹ��Luaջ
		pStack->pushString(pHead, iHeadLen);
		//��ͷ����ѹ��Luaջ
		pStack->pushInt(iHeadLen);
		//��������ѹ��Luaջ
		pStack->pushString(pBody, iBodyLen);
		//���峤��ѹ��Luaջ
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
	//�������Ϳ����Դ� �� ������
	if (m_bPushSwitch && iBufSize>0){
		//ע���Lua�������ͺ���
		if (0 != m_iDataCBHandler)
		{
			//��ȡbuffer�е�һ�����ݰ�
			PushDataToLua(m_receiveDataBuffer.GetData());
		}
	}

	if (WebSocket::State::OPEN == m_pSocket->getReadyState()){
		//����δ������
		if (m_sendDataBuffer.GetBufferSize()>0)
		{
			sendCacheMsg(m_sendDataBuffer.GetData());
		}
	}
}



