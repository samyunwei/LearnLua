/*************************************************************************
	> File Name: main.c
	> Author: Sam
	> Mail: samyunwei@163.com 
	> Created Time: 六 11/26 21:44:25 2016
 ************************************************************************/

#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <math.h>
#include <dirent.h>
#include <errno.h>

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

static const struct luaL_Reg mylib[] = {
    {"dir",l_dir},
    {"sin",l_sin},
    {NULL,NULL}
};

int luaopen_mylib(lua_State *L)
{
    lua_newtable(L);
    luaL_setfuncs(L,mylib,0);
    return 1;
}
