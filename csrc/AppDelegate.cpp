#include "AppDelegate.h"
#include "scripting/lua-bindings/manual/CCLuaEngine.h"
#include "audio/include/SimpleAudioEngine.h"
#include "cocos2d.h"
#include "scripting/lua-bindings/manual/lua_module_register.h"

#include "pbc-lua.h"
//WebSocket Lua binging
#include "lua_WebSocketDlg_auto.hpp"
#include "lua_ScreenUtility_auto.hpp"
#include "lua_GameTools_auto.hpp"
#include "ScreenUtility.h"

#define _DEBUG
#if (CC_TARGET_PLATFORM == CC_PLATFORM_WIN32)
//static cocos2d::Size designResolutionSize = cocos2d::Size(1280, 720);
//static cocos2d::Size designResolutionSize = cocos2d::Size(800, 480);
static cocos2d::Size designResolutionSize = cocos2d::Size(480, 800);
#else
static cocos2d::Size designResolutionSize = cocos2d::Size(720, 1280);
#endif
using namespace CocosDenshion;

USING_NS_CC;
using namespace std;

AppDelegate::AppDelegate()
{
}

AppDelegate::~AppDelegate()
{
	SimpleAudioEngine::end();

#if (COCOS2D_DEBUG > 0) && (CC_CODE_IDE_DEBUG_SUPPORT > 0)
	// NOTE:Please don't remove this call if you want to debug with Cocos Code IDE
	RuntimeEngine::getInstance()->end();
#endif

}

// if you want a different context, modify the value of glContextAttrs
// it will affect all platforms
void AppDelegate::initGLContextAttrs()
{
	// set OpenGL context attributes: red,green,blue,alpha,depth,stencil
	GLContextAttrs glContextAttrs = { 8, 8, 8, 8, 24, 8 };

	GLView::setGLContextAttrs(glContextAttrs);
}

// if you want to use the package manager to install more packages, 
// don't modify or remove this function
static int register_all_packages()
{
	return 0; //flag for packages manager
}

bool AppDelegate::applicationDidFinishLaunching()
{
	// set default FPS
	Director::getInstance()->setAnimationInterval(1.0 / 60.0f);

	auto director = Director::getInstance();
	auto glview = director->getOpenGLView();

	//分辨率适配
//    Size sizDC = ComputWinSize();
//    glview->setFrameSize(designResolutionSize.width, designResolutionSize.height);
    glview->setDesignResolutionSize(designResolutionSize.width, designResolutionSize.height, ResolutionPolicy::EXACT_FIT);

	// 开启控制台
#/*if CC_TARGET_PLATFORM==CC_PLATFORM_WIN32  
	AllocConsole();
	freopen("CONIN$", "r", stdin);
	freopen("CONOUT$", "w", stdout);
	freopen("CONOUT$", "w", stderr);
	#endif  */

	// register lua module
	auto engine = LuaEngine::getInstance();
	ScriptEngineManager::getInstance()->setScriptEngine(engine);
	lua_State* L = engine->getLuaStack()->getLuaState();
	lua_module_register(L);

	register_all_packages();

	LuaStack* stack = engine->getLuaStack();
	stack->setXXTEAKeyAndSign("mykeymaj111", strlen("mykeymaj+111"), "mysign222", strlen("mysign222"));

	//register custom function
	//LuaStack* stack = engine->getLuaStack();
	//register_custom_function(stack->getLuaState());

	//注册pbc Lua绑定接口
	luaopen_protobuf_c(stack->getLuaState());
	//注册WebSocket Lua绑定接口
	register_all_WebSocketDlg(stack->getLuaState());
	//注册屏幕适配 Lua绑定接口
	register_all_ScreenUtility(stack->getLuaState());

	register_all_NetManager(stack->getLuaState());

#if CC_64BITS
	FileUtils::getInstance()->addSearchPath("src/64bit");
#endif
	/*FileUtils::getInstance()->addSearchPath("src");
	FileUtils::getInstance()->addSearchPath("res");
	FileUtils::getInstance()->addSearchPath("base");
	FileUtils::getInstance()->addSearchPath("games");
	FileUtils::getInstance()->addSearchPath("games/common");*/
	if (engine->executeScriptFile("src/main.lua"))
	{ 
		if (engine->executeScriptFile("src/main.luac"))
		{
			return false;
		}
	}
	return true;
}

// This function will be called when the app is inactive. Note, when receiving a phone call it is invoked.
void AppDelegate::applicationDidEnterBackground()
{
	Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("APP_ENTER_BACKGROUND_EVENT");

	Director::getInstance()->stopAnimation();

	SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
	Director::getInstance()->getEventDispatcher()->dispatchCustomEvent("APP_ENTER_FOREGROUND_EVENT");
	Director::getInstance()->startAnimation();

	SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
   
    
}

//计算窗口尺寸
Size AppDelegate::ComputWinSize()
{
	CScreenUtility* pScreenUtl = CScreenUtility::GetInstance();

	//获取屏幕尺寸
	Size sizFrame = Director::getInstance()->getOpenGLView()->getFrameSize();
	//计算屏幕尺寸比值
	float fRatioFrame = sizFrame.width / sizFrame.height;
	//标准尺寸比值
	float fRatio1 = 1136.0f / 640.0f;     //1136*640
	float fRatio2 = 1024.0f / 768.0f;     //1024*768
	float fRatio3 = 960.0f / 640.0f;      //960*640

	//计算屏幕比值与标准尺寸比值差
	float fRaDlt1 = abs(fRatioFrame - fRatio1);
	float fRaDlt2 = abs(fRatioFrame - fRatio2);
	float fRaDlt3 = abs(fRatioFrame - fRatio3);

	//取出最小差值
	float fMin = fRaDlt1 < fRaDlt2 ? fRaDlt1 : fRaDlt2;
	fMin = fMin < fRaDlt3 ? fMin : fRaDlt3;

	//确定使用的标准尺寸
	int iType = 0;
	Size sizST = Size();
	if (fMin == fRaDlt1){
		sizST.width = 1136.0f;
		sizST.height = 640.0f;
		iType = STD_SIZE_1163;
	}
	else if (fMin == fRaDlt2){
		sizST.width = 1024.0f;
		sizST.height = 768.0f;
		iType = STD_SIZE_1024;
	}
	else if (fMin == fRaDlt3){
		sizST.width = 960.0f;
		sizST.height = 640.0f;
		iType = STD_SIZE_960;
	}
	pScreenUtl->SetDSizeType(iType);

	//计算使用的标准尺寸与屏幕尺寸 宽 高比值
	float fRaWidth = sizST.width / sizFrame.width;
	float fRaHeight = sizST.height / sizFrame.height;

	//计算缩放之后的尺寸
	float fSclWidth = sizFrame.width*fRaHeight;
	float fSclHeight = sizFrame.height*fRaWidth;

	//计算缩放之后尺寸与标准尺寸差值
	float fDltW = fSclWidth - sizST.width;
	float fDltH = fSclHeight - sizST.height;

	//差值都大于等于零
	if (0.0f <= fDltW&& 0.0f <= fDltH){
		//获取最小差值
		float fMinDlt = fDltW < fDltH ? fDltW : fDltH;
		if (fMinDlt == fDltW){   //宽度差值小
			sizST.width = fSclWidth;
		}
		else if (fMinDlt == fDltH){   //高度差值小
			sizST.height = fSclHeight;
		}
	}
	else{  //差值有小于零
		//选择大于等于零差值适配
		if (0.0f <= fDltW){
			sizST.width = fSclWidth;
		}
		else if (0.0f <= fDltH){
			sizST.height = fSclHeight;
		}
	}

	//计算与标准尺寸增量值
	float fWDlt = 0.0f;
	float fHDlt = 0.0f;
	if (STD_SIZE_1163 == iType){
		fWDlt = sizST.width - 1136.0f;
		fHDlt = sizST.height - 640.0f;
	}
	else if (STD_SIZE_1024 == iType){
		fWDlt = sizST.width - 1024.0f;
		fHDlt = sizST.height - 760.0f;
	}
	else if (STD_SIZE_960 == iType){
		fWDlt = sizST.width - 960.0f;
		fHDlt = sizST.height - 640.0f;
	}
	pScreenUtl->SetScreenDlt(fWDlt, fHDlt);

	return sizST;
}

