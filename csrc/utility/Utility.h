//��̬������
#ifndef __UTILITY_H__
#define __UTILITY_H__

class CUtility
{
public:
  //Shot ת Byte
  //@ sSrc:����Shot
  //@ pDes:���char*
  //@ iOffset:ת����Byte���������Char*�е�ƫ��
  static void Short2Byte(short sSrc, unsigned char* pDes, int iOffset);

  //Byte ת Shot ��λ��ǰ
  //@ pSrc:����Char*
  //@ iOffset:����Byte������Char*��ƫ�Ƶ�ַ
  static short Byte2Short(unsigned char* pSrc, int iOffset);
};

#endif