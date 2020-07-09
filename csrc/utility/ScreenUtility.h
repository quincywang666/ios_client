//��Ļ���乤����  ����
#ifndef __SCREEN_UTILITY_H__
#define __SCREEN_UTILITY_H__

#define STD_SIZE_1163 1
#define STD_SIZE_1024 2
#define STD_SIZE_960 3

class CScreenUtility
{
public:
  CScreenUtility();
  ~CScreenUtility();

  // - - - - - - - - Lua���ܷ��ʽӿ� - - - - - - - - 
  static CScreenUtility* GetInstance();

  //��ȡ���ʱ�ߴ�����
  int GetDSizeType();

  //��ȡ��Ļ�������ֵ
  float GetWidthDlt();

  //��ȡ��Ļ�������ֵ
  float GetHeightDlt();
  // - - - - - - - - Lua���ܷ��ʽӿ� - - - - - - - - 

  //�������ʱ�ߴ�����
  void SetDSizeType(int iType);

  //������ĻDlt����
  //@ fWDlt:��Ļ���Dlt����ֵ
  //@ fHDlt:��Ļ�߶�Dlt����ֵ
  void SetScreenDlt(float fWDlt, float fHDlt);
private:
  static CScreenUtility* s_pInstance;

  //���ʱ�ߴ�����
  int m_iDSizeType;

  //��Ļ���Dlt����
  float m_fWidthDlt;

  //��Ļ�߶�Dlt����
  float m_fHeightDlg;
};
#endif
