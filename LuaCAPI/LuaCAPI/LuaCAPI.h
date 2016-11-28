#ifndef LUACAPI_H
#define LUACAPI_H


#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#include <string.h>
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include <dirent.h>
#include <errno.h>
#include <math.h>

static int l_sin(lua_State *L)
{
    double d = luaL_checknumber(L,1);
    lua_pushnumber(L,sin(d));
    return 1;
}

static int l_dir(lua_State *L)
{
    DIR *dir;
    struct dirent *entry;
    int i;
    const char *path = luaL_checkstring(L,1);
    dir = opendir(path);
    if(dir == NULL)
    {
        lua_pushnil(L);
        lua_pushstring(L,strerror(errno));
        return 2;
    }

    lua_newtable(L);
    i = 1;
    while((entry = readdir(dir)) != NULL)
    {
        lua_pushnumber(L,i++);
        lua_pushstring(L,entry->d_name);
        lua_settable(L,-3);
    }

    closedir(dir);
    return 1;
}

static int l_map(lua_State *L)
{
    int i,n;
    luaL_checktype(L,1,LUA_TTABLE);
    luaL_checktype(L,2,LUA_TFUNCTION);

    n = lua_rawlen(L,1);

    for(i = 1;i <= n;i++)
    {
        lua_pushvalue(L,2);
        lua_rawgeti(L,1,i);
        lua_call(L,1,1);
        lua_rawseti(L,1,i);
    }

    return 0;
}


static const struct luaL_Reg mylib[] = {
    {"dir",l_dir},
    {"sin",l_sin},
    {"map",l_map},
    {NULL,NULL}
};

int luaopen_mylib(lua_State *L)
{
    lua_newtable(L);
    luaL_setfuncs(L,mylib,0);
    return 1;
}

#ifdef __cplusplus
}
#endif

#endif // LUACAPI_H
