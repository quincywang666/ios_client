//WebSocket 数据缓存
#ifndef __WEBSOCKET_BUFFER_H__
#define __WEBSOCKET_BUFFER_H__
#include <list>
#include <string>
#include <vector>

using namespace std;

class CWSDataBuffer
{
public:
	struct DataInfo
	{
		unsigned char* srcData;
		int dataLen;
	};
public:
	CWSDataBuffer();
	~CWSDataBuffer();

	//获取数据缓存大小
	int GetBufferSize();

	//存放数据
	//@ pData:数据
	//@ iLen:数据长度
	void PushData(unsigned char* pData, int iLen);

	//获取数据
	DataInfo GetData();

	//清空缓存
	void ClearBuffer();
private:
	//数据缓存队列
	vector<DataInfo> m_dataList;
};

#endif