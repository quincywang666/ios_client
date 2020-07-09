//websocket ������
//Lua�󶨣�lua��ֱ�ӷ��ʽ���websocket����
#ifndef __WEBSOCKET_DLG_H__
#define __WEBSOCKET_DLG_H__
#include <string>
#include "cocos2d.h"
#include "network/WebSocket.h"
#include "WSDataBuffer.h"

using namespace std;
using namespace cocos2d;
using namespace cocos2d::network;

#define WS_CONNECTING 0            //������
#define WS_OPEN 1                  //������
#define WS_CLOSEING 2              //�ر���
#define WS_CLOSED 3                //�ѹر�
#define WS_NONE_INIT 4             //δ��ʼ��

#define WS_TIME_OUT 5              //���ӳ�ʱ
#define WS_CONNECTION_FAILURE 6    //����ʧ��
#define WS_UNKNOWN_ERROR 7         //δ֪����

#define WS_ENTER_FOREGROUND 8      //�ͻ���תǰ̨
#define WS_ENTER_BACKGROUND 9      //�ͻ���ת��̨


class CWebSocketDlg :public Node, public WebSocket::Delegate
{
public:
	CWebSocketDlg();
	~CWebSocketDlg();

	// - - - - - - - - - - - Lua��ɼ��ӿ� - - - - - - - - - - - 
	//��ȡʵ���ӿ�
	static CWebSocketDlg* GetInstance();

	//ע�����ݻص�����
	//@ iCBHandler:lua�������
	//Lua����ԭ��: function(strHeadData, iHeadLen, strBodyData, iBodyLen);
	//strHeadData:��ͷ����
	//iHeadLen:��ͷ���ݳ���
	//strBodyData:��������
	//iBodyLen:�������ݳ���
	void RegDataCallBack(int iCBHandler);

	//ע��״̬�ص�����
	//# iCBHandler:lua�������
	//Lua����ԭ��: function(iState);
	//iState:socket״̬�� WS_XXXXX ����
	void RegStateCallBack(int iCBHandler);

	//ɾ���ص�����
	void RemoveAllCallBack();

	//������������״̬
	//@ bState: true:������������  false:�ر���������
	void SetDataPushState(bool bState);

	//��ʼ�����ӣ���ʼ��֮����Զ����ӷ�����
	//@ strHost:���ӵ�ַ
	//@ iPort:�˿ں�
	void InitSocket(const string& strHost, int iPort);

	//�رշ���������
	void Close();

	//����������
	void ReConnect();

	//��ȡ����״̬
	int GetSocketState();

	//��������
	//(�п��ܳ���Lua�㴫�ݵĶ��������ݱ��ضϣ������ԣ������������cocos��LuaBasicConversions.cpp ::luaval_to_std_string����ֱ��ʹ����string�Ĺ���û�д����Ȱ汾)
	//@ pHead:��ͷ����
	//@ iHeadLen:��ͷ���ݳ���
	//@ pBody:��������
	//@ iBodyLen:�������ݳ���
	void SendMsg(const char* strHead, int iHeadLen, const char* strBody, int iBodyLen);
	// - - - - - - - - - - - Lua��ɼ��ӿ� - - - - - - - - - - - 

	//���ӷ�����
	bool Connect();

	void update(float dt);

	static CWebSocketDlg* create();
	bool init();

private:
	void sendCacheMsg(CWSDataBuffer::DataInfo info);

	void sendMsg(unsigned char* msg, unsigned int len);
	//֪ͨlua��socket״̬���
	void SocketStateToLua(int iState);

	//websocket �ص�����
	virtual void onOpen(WebSocket* ws);
	virtual void onMessage(WebSocket* ws, const WebSocket::Data& data);
	virtual void onClose(WebSocket* ws);
	virtual void onError(WebSocket* ws, const WebSocket::ErrorCode& error);


	//�ӳ�����������
	void OnReConnect();

	//�������ݵ�Lua��
	void PushDataToLua(CWSDataBuffer::DataInfo info);

	//����ʵ��ָ��
	static CWebSocketDlg* s_pInstance;

	//Lua�����ݻص��������
	int m_iDataCBHandler;
	//Lua��״̬�ص��������
	int m_iStateCBHandler;

	//�������Ϳ���
	bool m_bPushSwitch;

	//websocke ����ָ��
	WebSocket* m_pSocket;
	//�����Ͽ���־
	bool m_bNeedClose;

	//���ӵ�ַ
	string m_strHost;
	//�˿ں�
	int m_iPort;

	//�������ݻ�����
	CWSDataBuffer m_receiveDataBuffer;

	//�������ݻ�����
	CWSDataBuffer m_sendDataBuffer;
};
#endif
