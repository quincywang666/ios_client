//WebSocket ���ݻ���
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

	//��ȡ���ݻ����С
	int GetBufferSize();

	//�������
	//@ pData:����
	//@ iLen:���ݳ���
	void PushData(unsigned char* pData, int iLen);

	//��ȡ����
	DataInfo GetData();

	//��ջ���
	void ClearBuffer();
private:
	//���ݻ������
	vector<DataInfo> m_dataList;
};

#endif