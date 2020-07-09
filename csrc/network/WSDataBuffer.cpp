#include "WSDataBuffer.h"



CWSDataBuffer::CWSDataBuffer()
{
}


CWSDataBuffer::~CWSDataBuffer()
{
}

//��ȡ���ݻ����С
int CWSDataBuffer::GetBufferSize()
{
	return m_dataList.size();
}

//�������
//@ pData:����
//@ iLen:���ݳ���
void CWSDataBuffer::PushData(unsigned char* pData, int iLen)
{
	DataInfo info;
	info.srcData = new unsigned char[iLen];
	memmove(info.srcData, pData, iLen);
	info.dataLen = iLen;
	m_dataList.push_back(info);
	return;
}



////��ȡ����
CWSDataBuffer::DataInfo CWSDataBuffer::GetData()
{
	DataInfo info;
	if (m_dataList.size() > 0){
		info = m_dataList.front();
		m_dataList.erase(m_dataList.begin());
	}
	return info;
}

//��ջ���
void CWSDataBuffer::ClearBuffer()
{
	m_dataList.clear();
	return;
}
