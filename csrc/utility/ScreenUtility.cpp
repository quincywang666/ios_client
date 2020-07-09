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

//获取设计时尺寸类型
int CScreenUtility::GetDSizeType()
{
  return m_iDSizeType;
}

//获取屏幕宽度增量值
float CScreenUtility::GetWidthDlt()
{
  return m_fWidthDlt;
}

//获取屏幕宽度增量值
float CScreenUtility::GetHeightDlt()
{
  return m_fHeightDlg;
}

//设置设计时尺寸类型
void CScreenUtility::SetDSizeType(int iType)
{
  m_iDSizeType=iType;
  return;
}

//设置屏幕Dlt增量
//@ fWDlt:屏幕宽度Dlt增量值
//@ fHDlt:屏幕高度Dlt增量值
void CScreenUtility::SetScreenDlt(float fWDlt, float fHDlt)
{
  m_fWidthDlt=fWDlt;
  m_fHeightDlg=fHDlt;
  return;
}
