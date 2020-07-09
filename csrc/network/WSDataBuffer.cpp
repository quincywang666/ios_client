#include "WSDataBuffer.h"



CWSDataBuffer::CWSDataBuffer()
{
}


CWSDataBuffer::~CWSDataBuffer()
{
}

//获取数据缓存大小
int CWSDataBuffer::GetBufferSize()
{
	return m_dataList.size();
}

//存放数据
//@ pData:数据
//@ iLen:数据长度
void CWSDataBuffer::PushData(unsigned char* pData, int iLen)
{
	DataInfo info;
	info.srcData = new unsigned char[iLen];
	memmove(info.srcData, pData, iLen);
	info.dataLen = iLen;
	m_dataList.push_back(info);
	return;
}



////获取数据
CWSDataBuffer::DataInfo CWSDataBuffer::GetData()
{
	DataInfo info;
	if (m_dataList.size() > 0){
		info = m_dataList.front();
		m_dataList.erase(m_dataList.begin());
	}
	return info;
}

//清空缓存
void CWSDataBuffer::ClearBuffer()
{
	m_dataList.clear();
	return;
}
