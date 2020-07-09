//websocket 单例类
//Lua绑定，lua层直接访问进行websocket连接
#ifndef __WEBSOCKET_DLG_H__
#define __WEBSOCKET_DLG_H__
#include <string>
#include "cocos2d.h"
#include "network/WebSocket.h"
#include "WSDataBuffer.h"

using namespace std;
using namespace cocos2d;
using namespace cocos2d::network;

#define WS_CONNECTING 0            //连接中
#define WS_OPEN 1                  //已连接
#define WS_CLOSEING 2              //关闭中
#define WS_CLOSED 3                //已关闭
#define WS_NONE_INIT 4             //未初始化

#define WS_TIME_OUT 5              //连接超时
#define WS_CONNECTION_FAILURE 6    //连接失败
#define WS_UNKNOWN_ERROR 7         //未知错误

#define WS_ENTER_FOREGROUND 8      //客户端转前台
#define WS_ENTER_BACKGROUND 9      //客户端转后台


class CWebSocketDlg :public Node, public WebSocket::Delegate
{
public:
	CWebSocketDlg();
	~CWebSocketDlg();

	// - - - - - - - - - - - Lua层可见接口 - - - - - - - - - - - 
	//获取实例接口
	static CWebSocketDlg* GetInstance();

	//注册数据回调函数
	//@ iCBHandler:lua函数句柄
	//Lua函数原型: function(strHeadData, iHeadLen, strBodyData, iBodyLen);
	//strHeadData:包头数据
	//iHeadLen:包头数据长度
	//strBodyData:包体数据
	//iBodyLen:包体数据长度
	void RegDataCallBack(int iCBHandler);

	//注册状态回调函数
	//# iCBHandler:lua函数句柄
	//Lua函数原型: function(iState);
	//iState:socket状态码 WS_XXXXX 常量
	void RegStateCallBack(int iCBHandler);

	//删除回调函数
	void RemoveAllCallBack();

	//设置数据推送状态
	//@ bState: true:开启数据推送  false:关闭数据推送
	void SetDataPushState(bool bState);

	//初始化连接，初始化之后会自动连接服务器
	//@ strHost:连接地址
	//@ iPort:端口号
	void InitSocket(const string& strHost, int iPort);

	//关闭服务器连接
	void Close();

	//重连服务器
	void ReConnect();

	//获取连接状态
	int GetSocketState();

	//发送数据
	//(有可能出现Lua层传递的二进制数据被截断，待测试，可疑问题代码cocos库LuaBasicConversions.cpp ::luaval_to_std_string函数直接使用了string的构造没有带长度版本)
	//@ pHead:包头数据
	//@ iHeadLen:包头数据长度
	//@ pBody:包体数据
	//@ iBodyLen:包体数据长度
	void SendMsg(const char* strHead, int iHeadLen, const char* strBody, int iBodyLen);
	// - - - - - - - - - - - Lua层可见接口 - - - - - - - - - - - 

	//连接服务器
	bool Connect();

	void update(float dt);

	static CWebSocketDlg* create();
	bool init();

private:
	void sendCacheMsg(CWSDataBuffer::DataInfo info);

	void sendMsg(unsigned char* msg, unsigned int len);
	//通知lua层socket状态变更
	void SocketStateToLua(int iState);

	//websocket 回调函数
	virtual void onOpen(WebSocket* ws);
	virtual void onMessage(WebSocket* ws, const WebSocket::Data& data);
	virtual void onClose(WebSocket* ws);
	virtual void onError(WebSocket* ws, const WebSocket::ErrorCode& error);


	//延迟重连服务器
	void OnReConnect();

	//推送数据到Lua层
	void PushDataToLua(CWSDataBuffer::DataInfo info);

	//单例实例指针
	static CWebSocketDlg* s_pInstance;

	//Lua层数据回调函数句柄
	int m_iDataCBHandler;
	//Lua层状态回调函数句柄
	int m_iStateCBHandler;

	//数据推送开关
	bool m_bPushSwitch;

	//websocke 对象指针
	WebSocket* m_pSocket;
	//主动断开标志
	bool m_bNeedClose;

	//连接地址
	string m_strHost;
	//端口号
	int m_iPort;

	//接受数据缓冲区
	CWSDataBuffer m_receiveDataBuffer;

	//发送数据缓冲区
	CWSDataBuffer m_sendDataBuffer;
};
#endif
