#include "lua_WebSocketDlg_auto.hpp"
#include "WebSocketDlg.h"
#include "WSDataBuffer.h"
#include "scripting/lua-bindings/manual/tolua_fix.h"
#include "scripting/lua-bindings/manual/LuaBasicConversions.h"
#include "tolua++.h"

int lua_WebSocketDlg_CWebSocketDlg_GetSocketState(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_GetSocketState'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_GetSocketState'", nullptr);
            return 0;
        }
        int ret = cobj->GetSocketState();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:GetSocketState",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_GetSocketState'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_RegDataCallBack(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_RegDataCallBack'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
//         int arg0;
// 
//         ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "CWebSocketDlg:RegDataCallBack");
//         if(!ok)
//         {
//             tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_RegDataCallBack'", nullptr);
//             return 0;
//         }
//         cobj->RegDataCallBack(arg0);
//         lua_settop(tolua_S, 1);

      //提取lua栈第二个元素，lua回调函数，使用toluafix_ref_function将回调函数映射成int值
      int handler=(toluafix_ref_function(tolua_S, 2, 0));
      cobj->RegDataCallBack(handler);

        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:RegDataCallBack",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_RegDataCallBack'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_InitSocket(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_InitSocket'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 2) 
    {
        std::string arg0;
        int arg1;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0, "CWebSocketDlg:InitSocket");

        ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "CWebSocketDlg:InitSocket");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_InitSocket'", nullptr);
            return 0;
        }
        cobj->InitSocket(arg0, arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:InitSocket",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_InitSocket'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_ReConnect(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_ReConnect'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_ReConnect'", nullptr);
            return 0;
        }
        cobj->ReConnect();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:ReConnect",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_ReConnect'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_RegStateCallBack(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_RegStateCallBack'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
//         int arg0;
// 
//         ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "CWebSocketDlg:RegStateCallBack");
//         if(!ok)
//         {
//             tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_RegStateCallBack'", nullptr);
//             return 0;
//         }
//         cobj->RegStateCallBack(arg0);
//         lua_settop(tolua_S, 1);

        //提取lua栈第二个元素，lua回调函数，使用toluafix_ref_function将回调函数映射成int值
        int handler=(toluafix_ref_function(tolua_S, 2, 0));
        cobj->RegStateCallBack(handler);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:RegStateCallBack",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_RegStateCallBack'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_Close(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_Close'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_Close'", nullptr);
            return 0;
        }
        cobj->Close();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:Close",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_Close'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_SetDataPushState(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_SetDataPushState'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        bool arg0;

        ok &= luaval_to_boolean(tolua_S, 2,&arg0, "CWebSocketDlg:SetDataPushState");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_SetDataPushState'", nullptr);
            return 0;
        }
        cobj->SetDataPushState(arg0);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:SetDataPushState",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_SetDataPushState'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_RemoveAllCallBack(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_RemoveAllCallBack'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_RemoveAllCallBack'", nullptr);
            return 0;
        }
        cobj->RemoveAllCallBack();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:RemoveAllCallBack",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_RemoveAllCallBack'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_SendMsg(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CWebSocketDlg*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_WebSocketDlg_CWebSocketDlg_SendMsg'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 4) 
    {
        std::string arg0;
        int arg1;
        std::string arg2;
        int arg3;

		const char* test2= tolua_tostring(tolua_S, 2, NULL);

        ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "CWebSocketDlg:SendMsg");

		const char* test3= tolua_tostring(tolua_S, 4, NULL);

        ok &= luaval_to_int32(tolua_S, 5,(int *)&arg3, "CWebSocketDlg:SendMsg");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_SendMsg'", nullptr);
            return 0;
        }
        cobj->SendMsg(test2, arg1, test3, arg3);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:SendMsg",argc, 4);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_SendMsg'.",&tolua_err);
#endif

    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_GetInstance(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"CWebSocketDlg",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_GetInstance'", nullptr);
            return 0;
        }
        CWebSocketDlg* ret = CWebSocketDlg::GetInstance();
        object_to_luaval<CWebSocketDlg>(tolua_S, "CWebSocketDlg",(CWebSocketDlg*)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "CWebSocketDlg:GetInstance",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_GetInstance'.",&tolua_err);
#endif
    return 0;
}
int lua_WebSocketDlg_CWebSocketDlg_constructor(lua_State* tolua_S)
{
    int argc = 0;
    CWebSocketDlg* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_WebSocketDlg_CWebSocketDlg_constructor'", nullptr);
            return 0;
        }
        cobj = new CWebSocketDlg();
        cobj->autorelease();
        int ID =  (int)cobj->_ID ;
        int* luaID =  &cobj->_luaID ;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void*)cobj,"CWebSocketDlg");
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CWebSocketDlg:CWebSocketDlg",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_WebSocketDlg_CWebSocketDlg_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_WebSocketDlg_CWebSocketDlg_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (CWebSocketDlg)");
    return 0;
}

int lua_register_WebSocketDlg_CWebSocketDlg(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"CWebSocketDlg");
    tolua_cclass(tolua_S,"CWebSocketDlg","CWebSocketDlg","cc.Node",nullptr);

    tolua_beginmodule(tolua_S,"CWebSocketDlg");
        tolua_function(tolua_S,"new",lua_WebSocketDlg_CWebSocketDlg_constructor);
        tolua_function(tolua_S,"GetSocketState",lua_WebSocketDlg_CWebSocketDlg_GetSocketState);
        tolua_function(tolua_S,"RegDataCallBack",lua_WebSocketDlg_CWebSocketDlg_RegDataCallBack);
        tolua_function(tolua_S,"InitSocket",lua_WebSocketDlg_CWebSocketDlg_InitSocket);
        tolua_function(tolua_S,"ReConnect",lua_WebSocketDlg_CWebSocketDlg_ReConnect);
        tolua_function(tolua_S,"RegStateCallBack",lua_WebSocketDlg_CWebSocketDlg_RegStateCallBack);
        tolua_function(tolua_S,"Close",lua_WebSocketDlg_CWebSocketDlg_Close);
        tolua_function(tolua_S,"SetDataPushState",lua_WebSocketDlg_CWebSocketDlg_SetDataPushState);
        tolua_function(tolua_S,"RemoveAllCallBack",lua_WebSocketDlg_CWebSocketDlg_RemoveAllCallBack);
        tolua_function(tolua_S,"SendMsg",lua_WebSocketDlg_CWebSocketDlg_SendMsg);
        tolua_function(tolua_S,"GetInstance", lua_WebSocketDlg_CWebSocketDlg_GetInstance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(CWebSocketDlg).name();
    g_luaType[typeName] = "CWebSocketDlg";
    g_typeCast["CWebSocketDlg"] = "CWebSocketDlg";
    return 1;
}
TOLUA_API int register_all_WebSocketDlg(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,nullptr,0);
	tolua_beginmodule(tolua_S,nullptr);

	lua_register_WebSocketDlg_CWebSocketDlg(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

