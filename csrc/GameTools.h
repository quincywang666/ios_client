//WebSocket ���ݻ���
#ifndef __WEBSOCKET_BUFFER_H__
#define __WEBSOCKET_BUFFER_H__
#include <list>
#include <string>

using namespace std;

class CGameTools
{
public:
  CGameTools();
  ~CGameTools();
  static CGameTools* getInstance();
  //��ȡ���ݻ����С
  int GetBufferSize();

  //�������
  //@ pData:����
  //@ iLen:���ݳ���
  void PushData(const char* pData, int iLen);

  //��ȡ����
  string GetData();

  //��ջ���
  void ClearBuffer();

  void addHandler(int handerid);

  void handler_CB();

private:
  //���ݻ������
  list<string> m_listBuffer;

  int cb_handerID;
};

#endif