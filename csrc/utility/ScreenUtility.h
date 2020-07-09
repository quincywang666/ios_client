//屏幕适配工具类  单例
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

  // - - - - - - - - Lua层能访问接口 - - - - - - - - 
  static CScreenUtility* GetInstance();

  //获取设计时尺寸类型
  int GetDSizeType();

  //获取屏幕宽度增量值
  float GetWidthDlt();

  //获取屏幕宽度增量值
  float GetHeightDlt();
  // - - - - - - - - Lua层能访问接口 - - - - - - - - 

  //设置设计时尺寸类型
  void SetDSizeType(int iType);

  //设置屏幕Dlt增量
  //@ fWDlt:屏幕宽度Dlt增量值
  //@ fHDlt:屏幕高度Dlt增量值
  void SetScreenDlt(float fWDlt, float fHDlt);
private:
  static CScreenUtility* s_pInstance;

  //设计时尺寸类型
  int m_iDSizeType;

  //屏幕宽度Dlt增量
  float m_fWidthDlt;

  //屏幕高度Dlt增量
  float m_fHeightDlg;
};
#endif
