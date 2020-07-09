//WebSocket 数据缓存
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
  //获取数据缓存大小
  int GetBufferSize();

  //存放数据
  //@ pData:数据
  //@ iLen:数据长度
  void PushData(const char* pData, int iLen);

  //获取数据
  string GetData();

  //清空缓存
  void ClearBuffer();

  void addHandler(int handerid);

  void handler_CB();

private:
  //数据缓存队列
  list<string> m_listBuffer;

  int cb_handerID;
};

#endif