#include "lua_GameTools_auto.hpp"
#include "GameTools.h"
#include "scripting/lua-bindings/manual/tolua_fix.h"
#include "scripting/lua-bindings/manual/LuaBasicConversions.h"

int lua_NetManager_CGameTools_addHandler(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CGameTools*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_NetManager_CGameTools_addHandler'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        //int arg0;

        //ok &= luaval_to_int32(tolua_S, 2,(int *)&arg0, "CGameTools:addHandler");
        //if(!ok)
        //{
        //    tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_addHandler'", nullptr);
        //    return 0;
        //}
        //cobj->addHandler(arg0);
        //lua_settop(tolua_S, 1);
		//提取lua栈第二个元素，lua回调函数，使用toluafix_ref_function将回调函数映射成int值
		int handler = (toluafix_ref_function(tolua_S, 2, 0));
		cobj->addHandler(handler);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:addHandler",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_addHandler'.",&tolua_err);
#endif

    return 0;
}
int lua_NetManager_CGameTools_GetBufferSize(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CGameTools*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_NetManager_CGameTools_GetBufferSize'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_GetBufferSize'", nullptr);
            return 0;
        }
        int ret = cobj->GetBufferSize();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:GetBufferSize",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_GetBufferSize'.",&tolua_err);
#endif

    return 0;
}
int lua_NetManager_CGameTools_handler_CB(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CGameTools*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_NetManager_CGameTools_handler_CB'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_handler_CB'", nullptr);
            return 0;
        }
        cobj->handler_CB();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:handler_CB",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_handler_CB'.",&tolua_err);
#endif

    return 0;
}
int lua_NetManager_CGameTools_ClearBuffer(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CGameTools*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_NetManager_CGameTools_ClearBuffer'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_ClearBuffer'", nullptr);
            return 0;
        }
        cobj->ClearBuffer();
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:ClearBuffer",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_ClearBuffer'.",&tolua_err);
#endif

    return 0;
}
int lua_NetManager_CGameTools_GetData(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CGameTools*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_NetManager_CGameTools_GetData'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_GetData'", nullptr);
            return 0;
        }
        std::string ret = cobj->GetData();
        tolua_pushcppstring(tolua_S,ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:GetData",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_GetData'.",&tolua_err);
#endif

    return 0;
}
int lua_NetManager_CGameTools_PushData(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CGameTools*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_NetManager_CGameTools_PushData'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 2) 
    {
        const char* arg0;
        int arg1;

        std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp, "CGameTools:PushData"); arg0 = arg0_tmp.c_str();

        ok &= luaval_to_int32(tolua_S, 3,(int *)&arg1, "CGameTools:PushData");
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_PushData'", nullptr);
            return 0;
        }
        cobj->PushData(arg0, arg1);
        lua_settop(tolua_S, 1);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:PushData",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_PushData'.",&tolua_err);
#endif

    return 0;
}
int lua_NetManager_CGameTools_getInstance(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"CGameTools",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_getInstance'", nullptr);
            return 0;
        }
        CGameTools* ret = CGameTools::getInstance();
        object_to_luaval<CGameTools>(tolua_S, "CGameTools",(CGameTools*)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "CGameTools:getInstance",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_getInstance'.",&tolua_err);
#endif
    return 0;
}
int lua_NetManager_CGameTools_constructor(lua_State* tolua_S)
{
    int argc = 0;
    CGameTools* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_NetManager_CGameTools_constructor'", nullptr);
            return 0;
        }
        cobj = new CGameTools();
        tolua_pushusertype(tolua_S,(void*)cobj,"CGameTools");
        tolua_register_gc(tolua_S,lua_gettop(tolua_S));
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CGameTools:CGameTools",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_NetManager_CGameTools_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_NetManager_CGameTools_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (CGameTools)");
    return 0;
}

int lua_register_NetManager_CGameTools(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"CGameTools");
    tolua_cclass(tolua_S,"CGameTools","CGameTools","",nullptr);

    tolua_beginmodule(tolua_S,"CGameTools");
        tolua_function(tolua_S,"new",lua_NetManager_CGameTools_constructor);
        tolua_function(tolua_S,"addHandler",lua_NetManager_CGameTools_addHandler);
        tolua_function(tolua_S,"GetBufferSize",lua_NetManager_CGameTools_GetBufferSize);
        tolua_function(tolua_S,"handler_CB",lua_NetManager_CGameTools_handler_CB);
        tolua_function(tolua_S,"ClearBuffer",lua_NetManager_CGameTools_ClearBuffer);
        tolua_function(tolua_S,"GetData",lua_NetManager_CGameTools_GetData);
        tolua_function(tolua_S,"PushData",lua_NetManager_CGameTools_PushData);
        tolua_function(tolua_S,"getInstance", lua_NetManager_CGameTools_getInstance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(CGameTools).name();
    g_luaType[typeName] = "CGameTools";
    g_typeCast["CGameTools"] = "CGameTools";
    return 1;
}
TOLUA_API int register_all_NetManager(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,nullptr,0);
	tolua_beginmodule(tolua_S,nullptr);

	lua_register_NetManager_CGameTools(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

