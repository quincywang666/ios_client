#include "Utility.h"

//Shot 转 Byte
//@ sSrc:传入Shot
//@ pDes:输出char*
//@ iOffset:转换后Byte数据在输出Char*中的偏移
void CUtility::Short2Byte(short sSrc, unsigned char* pDes, int iOffset)
{
  pDes[iOffset]=(sSrc>>8)&0xff;
  pDes[iOffset+1]=sSrc&0xff;
  return;
}

//Byte 转 Shot 高位在前
//@ pSrc:传入Char*
//@ iOffset:传入Byte数据在Char*中偏移地址
short CUtility::Byte2Short(unsigned char* pSrc, int iOffset)
{
  short s0=(short)(pSrc[iOffset]&0xff);
  short s1=(short)(pSrc[iOffset+1]&0xff);
  s0<<=8;
  short s=(short)(s0|s1);
  return s;
}