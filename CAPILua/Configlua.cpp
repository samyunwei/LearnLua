#include "Configlua.h"


void load(lua_State *L,const char* fname,int * w,int* h)
{
    if(luaL_loadfile(L,fname) || lua_pcall(L,0,0,0))
    {
        error(L,"cannot run config.file:%s",lua_tostring(L,-1));
    }
    lua_getglobal(L,"width");
    lua_getglobal(L,"height");
    if(!lua_isnumber(L,-2))
    {
        error(L,"'width' should be a number\n");
    }
    if(!lua_isnumber(L,-1))
    {
        error(L,"'height' should be a number\n");
    }
    *w = lua_tointeger(L,-2);
    *h = lua_tointeger(L,-1);
}



int getfield(lua_State *L,const char *key)
{
    int result;
    lua_pushstring(L,key);
    lua_gettable(L,-2);
    if(!lua_isnumber(L,-1))
    {
        error(L,"invalid component in background color");
    }
        result = (int)lua_tonumber(L,-1);
        lua_pop(L,1);
        return result;
}


void setfield(lua_State *L,const char *index,int value)
{
    lua_pushfstring(L,index);
    lua_pushnumber(L,(double)value/MAX_COLOR);
    lua_settable(L,-3);
}

void setcolor(lua_State *L,struct ColorTable *ct)
{
    lua_newtable(L);
    setfield(L,"r",ct->red);
    setfield(L,"g",ct->green);
    setfield(L,"b",ct->blue);
    lua_setglobal(L,ct->name);
}
