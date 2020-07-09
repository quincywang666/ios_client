#include "lua_ScreenUtility_auto.hpp"
#include "ScreenUtility.h"
#include "scripting/lua-bindings/manual/tolua_fix.h"
#include "scripting/lua-bindings/manual/LuaBasicConversions.h"

int lua_ScreenUtility_CScreenUtility_GetWidthDlt(lua_State* tolua_S)
{
    int argc = 0;
    CScreenUtility* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CScreenUtility",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CScreenUtility*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_ScreenUtility_CScreenUtility_GetWidthDlt'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_ScreenUtility_CScreenUtility_GetWidthDlt'", nullptr);
            return 0;
        }
        double ret = cobj->GetWidthDlt();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CScreenUtility:GetWidthDlt",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_ScreenUtility_CScreenUtility_GetWidthDlt'.",&tolua_err);
#endif

    return 0;
}
int lua_ScreenUtility_CScreenUtility_GetDSizeType(lua_State* tolua_S)
{
    int argc = 0;
    CScreenUtility* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CScreenUtility",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CScreenUtility*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_ScreenUtility_CScreenUtility_GetDSizeType'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_ScreenUtility_CScreenUtility_GetDSizeType'", nullptr);
            return 0;
        }
        int ret = cobj->GetDSizeType();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CScreenUtility:GetDSizeType",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_ScreenUtility_CScreenUtility_GetDSizeType'.",&tolua_err);
#endif

    return 0;
}
int lua_ScreenUtility_CScreenUtility_GetHeightDlt(lua_State* tolua_S)
{
    int argc = 0;
    CScreenUtility* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"CScreenUtility",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (CScreenUtility*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_ScreenUtility_CScreenUtility_GetHeightDlt'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_ScreenUtility_CScreenUtility_GetHeightDlt'", nullptr);
            return 0;
        }
        double ret = cobj->GetHeightDlt();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CScreenUtility:GetHeightDlt",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_ScreenUtility_CScreenUtility_GetHeightDlt'.",&tolua_err);
#endif

    return 0;
}
int lua_ScreenUtility_CScreenUtility_GetInstance(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"CScreenUtility",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_ScreenUtility_CScreenUtility_GetInstance'", nullptr);
            return 0;
        }
        CScreenUtility* ret = CScreenUtility::GetInstance();
        object_to_luaval<CScreenUtility>(tolua_S, "CScreenUtility",(CScreenUtility*)ret);
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d\n ", "CScreenUtility:GetInstance",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_ScreenUtility_CScreenUtility_GetInstance'.",&tolua_err);
#endif
    return 0;
}
int lua_ScreenUtility_CScreenUtility_constructor(lua_State* tolua_S)
{
    int argc = 0;
    CScreenUtility* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
        {
            tolua_error(tolua_S,"invalid arguments in function 'lua_ScreenUtility_CScreenUtility_constructor'", nullptr);
            return 0;
        }
        cobj = new CScreenUtility();
        tolua_pushusertype(tolua_S,(void*)cobj,"CScreenUtility");
        tolua_register_gc(tolua_S,lua_gettop(tolua_S));
        return 1;
    }
    luaL_error(tolua_S, "%s has wrong number of arguments: %d, was expecting %d \n", "CScreenUtility:CScreenUtility",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_ScreenUtility_CScreenUtility_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_ScreenUtility_CScreenUtility_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (CScreenUtility)");
    return 0;
}

int lua_register_ScreenUtility_CScreenUtility(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"CScreenUtility");
    tolua_cclass(tolua_S,"CScreenUtility","CScreenUtility","",nullptr);

    tolua_beginmodule(tolua_S,"CScreenUtility");
        tolua_function(tolua_S,"new",lua_ScreenUtility_CScreenUtility_constructor);
        tolua_function(tolua_S,"GetWidthDlt",lua_ScreenUtility_CScreenUtility_GetWidthDlt);
        tolua_function(tolua_S,"GetDSizeType",lua_ScreenUtility_CScreenUtility_GetDSizeType);
        tolua_function(tolua_S,"GetHeightDlt",lua_ScreenUtility_CScreenUtility_GetHeightDlt);
        tolua_function(tolua_S,"GetInstance", lua_ScreenUtility_CScreenUtility_GetInstance);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(CScreenUtility).name();
    g_luaType[typeName] = "CScreenUtility";
    g_typeCast["CScreenUtility"] = "CScreenUtility";
    return 1;
}
TOLUA_API int register_all_ScreenUtility(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,nullptr,0);
	tolua_beginmodule(tolua_S,nullptr);

	lua_register_ScreenUtility_CScreenUtility(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

