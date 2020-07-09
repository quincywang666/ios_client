//静态工具类
#ifndef __UTILITY_H__
#define __UTILITY_H__

class CUtility
{
public:
  //Shot 转 Byte
  //@ sSrc:传入Shot
  //@ pDes:输出char*
  //@ iOffset:转换后Byte数据在输出Char*中的偏移
  static void Short2Byte(short sSrc, unsigned char* pDes, int iOffset);

  //Byte 转 Shot 高位在前
  //@ pSrc:传入Char*
  //@ iOffset:传入Byte数据在Char*中偏移地址
  static short Byte2Short(unsigned char* pSrc, int iOffset);
};

#endif