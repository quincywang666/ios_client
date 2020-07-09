#include "Utility.h"

//Shot ת Byte
//@ sSrc:����Shot
//@ pDes:���char*
//@ iOffset:ת����Byte���������Char*�е�ƫ��
void CUtility::Short2Byte(short sSrc, unsigned char* pDes, int iOffset)
{
  pDes[iOffset]=(sSrc>>8)&0xff;
  pDes[iOffset+1]=sSrc&0xff;
  return;
}

//Byte ת Shot ��λ��ǰ
//@ pSrc:����Char*
//@ iOffset:����Byte������Char*��ƫ�Ƶ�ַ
short CUtility::Byte2Short(unsigned char* pSrc, int iOffset)
{
  short s0=(short)(pSrc[iOffset]&0xff);
  short s1=(short)(pSrc[iOffset+1]&0xff);
  s0<<=8;
  short s=(short)(s0|s1);
  return s;
}