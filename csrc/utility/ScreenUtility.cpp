#include "ScreenUtility.h"

CScreenUtility* CScreenUtility::s_pInstance=nullptr;

CScreenUtility::CScreenUtility()
  :m_iDSizeType(0)
  ,m_fWidthDlt(0.0f)
  ,m_fHeightDlg(0.0f)
{
}


CScreenUtility::~CScreenUtility()
{
  s_pInstance=nullptr;
}

CScreenUtility* CScreenUtility::GetInstance()
{
  if(!s_pInstance){
    s_pInstance=new CScreenUtility();
  }
  return s_pInstance;
}

//��ȡ���ʱ�ߴ�����
int CScreenUtility::GetDSizeType()
{
  return m_iDSizeType;
}

//��ȡ��Ļ�������ֵ
float CScreenUtility::GetWidthDlt()
{
  return m_fWidthDlt;
}

//��ȡ��Ļ�������ֵ
float CScreenUtility::GetHeightDlt()
{
  return m_fHeightDlg;
}

//�������ʱ�ߴ�����
void CScreenUtility::SetDSizeType(int iType)
{
  m_iDSizeType=iType;
  return;
}

//������ĻDlt����
//@ fWDlt:��Ļ���Dlt����ֵ
//@ fHDlt:��Ļ�߶�Dlt����ֵ
void CScreenUtility::SetScreenDlt(float fWDlt, float fHDlt)
{
  m_fWidthDlt=fWDlt;
  m_fHeightDlg=fHDlt;
  return;
}
