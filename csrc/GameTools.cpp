#include "GameTools.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"


CGameTools::CGameTools()
{
}


CGameTools::~CGameTools()
{
}

static CGameTools* _CGinstance = NULL;

CGameTools* CGameTools::getInstance()
{
	if (_CGinstance==NULL)
	{
		_CGinstance = new CGameTools();
	}
	return _CGinstance;
}

//��ȡ���ݻ����С
int CGameTools::GetBufferSize()
{
  return m_listBuffer.size();
}

//�������
//@ pData:����
//@ iLen:���ݳ���
void CGameTools::PushData(const char* pData, int iLen)
{
  string strData(pData, iLen);
  m_listBuffer.push_back(strData);
  return;
}

//��ȡ����
string CGameTools::GetData()
{
  string strData;
  if(0<m_listBuffer.size()){
    strData=m_listBuffer.front();
    m_listBuffer.pop_front();
  }
  return strData;
}

//��ջ���
void CGameTools::ClearBuffer()
{
//  m_listBuffer.swap(list<string>());
    m_listBuffer.clear();
  return;
}


void CGameTools::addHandler(int handerid)
{
	cb_handerID = handerid;
	handler_CB();
}

void CGameTools::handler_CB()
{
	cocos2d::LuaEngine* pEngin = cocos2d::LuaEngine::getInstance();
	cocos2d::LuaStack* pStack = pEngin->getLuaStack();
	pStack->pushString("this is text1");
	pStack->pushString("this is text2");
	pStack->executeFunctionByHandler(cb_handerID, 2);
	pStack->clean();
}
