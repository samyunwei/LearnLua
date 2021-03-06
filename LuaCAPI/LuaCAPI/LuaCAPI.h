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
#include <ctype.h>
#include <limits.h>
#define BITS_PER_WORD  (CHAR_BIT*sizeof(unsigned int))
#define I_WORD(i)  ((unsigned int) (i) / BITS_PER_WORD)
#define I_BIT(i) (1 << ((unsigned int)(i) % BITS_PER_WORD))
#define checkarrary(L) \
    (NumArray*)luaL_checkudata(L,1,"LuaBook.array")
typedef struct NumArray{
    int size;
    unsigned int values[1];
}NumArray;

/*
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

static int l_split(lua_State *L)
{
    const char *s = luaL_checkstring(L,1);
    const char *sep = luaL_checkstring(L,2);
    const char *e;
    int i = 1;

    lua_newtable(L);

    while((e = strchr(s,*sep)) != NULL)
    {
        lua_pushlstring(L,s,e-s);
        lua_rawseti(L,-2,i++);
        s = e +1;
    }

    lua_pushstring(L,s);
    lua_rawseti(L,-2,i);
    return 1;
}

static int str_upper(lua_State *L)
{
    size_t l;
    size_t i;
    luaL_Buffer b;
    const char *s = luaL_checklstring(L,1,&l);
    luaL_buffinit(L,&b);
    for(i = 0;i<l;i++)
    {
        luaL_addchar(&b,toupper((unsigned char)(s[i])));
    }
    luaL_pushresult(&b);
    return 1;
}


static int counter(lua_State *L);

int newCounter(lua_State *L)
{
    lua_pushinteger(L,0);
    lua_pushcclosure(L,&counter,1);
    return 1;static void f_startElement(void *ud,const char  *name,const char **atts)
{
}


static int counter(lua_State *L)
{
    int val = lua_tointeger(L,lua_upvalueindex(1));
    lua_pushinteger(L,++val);
    lua_pushvalue(L,-1);
    lua_replace(L,lua_upvalueindex(1));
    return 1;
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

*/

//int t_tuple(lua_State *L)
//{
//    int op = luaL_optinteger(L,1,0);
//    if(op == 0)
//    {
//        int i = 0;
//        for(i = 1;!lua_isnone(L,lua_upvalueindex(i));i++)
//        {
//            lua_pushvalue(L,lua_upvalueindex(i));
//        }
//        return i-1;
//    }else
//    {
//        luaL_argcheck(L,0<op,1,"indext out of range");
//        if(lua_isnone(L,lua_upvalueindex(op)))
//        {
//            return 0;
//        }
//        lua_pushvalue(L,lua_upvalueindex(op));
//        return 1;
//    }
//}

//int t_new(lua_State *L)
//{
//    lua_pushcclosure(L,t_tuple,lua_gettop(L));
//    return 1;
//}

//static const struct luaL_Reg mylib[] = {
//   {"new",t_new},
//    {NULL,NULL}
//};

//int luaopen_mylib(lua_State *L)
//{
//    lua_newtable(L);
//    luaL_setfuncs(L,mylib,0);
//    return 1;
//}


static int newarray(lua_State *L)
{
    int i,n;
    size_t nbytes;
    NumArray *a;

    n = luaL_checkinteger(L,1);
   luaL_argcheck(L,n >=1,1,"invalid size");
   nbytes = sizeof(NumArray) + I_WORD(n-1) * sizeof(unsigned int);
   a = (NumArray *)lua_newuserdata(L,nbytes);

   a->size = n;
   for(i = 0;i <= I_WORD(n-1);i++)
   {
       a->values[i] = 0;
   }

   luaL_getmetatable(L,"LuaBook.array");
   lua_setmetatable(L,-2);
   return 1;
}

static unsigned int *getindex(lua_State *L,unsigned int* mask)
{
    NumArray* a = checkarrary(L);
    int index = luaL_checkinteger(L,2) - 1;
     luaL_argcheck(L,0 <= index && index < a->size,2,"index out of range");
     *mask = I_BIT(index);
     return &a->values[I_WORD(index)];
}

//static int setarray(lua_State *L)
//{
//    NumArray *a = (NumArray *) lua_touserdata(L,1);
//    int index = luaL_checkinteger(L,2) -1;
//    luaL_checkany(L,3);

//    luaL_argcheck(L,a != NULL,1," 'array' expected ");

//    luaL_argcheck(L,0 <= index && index < a->size,2,"index out of range");

//    if(lua_toboolean(L,3))
//    {
//        a->values[I_WORD(index)] |= I_BIT(index);
//    }else
//    {
//        a->values[I_WORD(index)] &= ~I_BIT(index);
//    }
//    return 0;
//}

//static int getarray(lua_State *L)
//{
//    NumArray *a = (NumArray*)lua_touserdata(L,1);
//    int index = luaL_checkinteger(L,2) - 1;

//    luaL_argcheck(L,a != NULL,1," 'array' expected");

//    luaL_argcheck(L,0 <= index && index <a->size,2,"index out of range");
//    lua_pushboolean(L,a->values[I_WORD(index)] & I_BIT(index));
//    return 1;
//}

static int setarray(lua_State *L)
{
    unsigned int mask;
    unsigned int *entry = getindex(L,&mask);
    luaL_checkany(L,3);
    if(lua_toboolean(L,3))
    {
        *entry |= mask;
    }else
    {
        *entry &= ~mask;
    }
    return 0;
}


static int getarray(lua_State *L)
{
    unsigned int mask;
    unsigned int *entry = getindex(L,&mask);
    lua_pushboolean(L,*entry & mask);
    return 1;
}



static int getsize(lua_State *L)
{
//    NumArray *a = (NumArray*)lua_touserdata(L,1);
//    luaL_argcheck(L, a != NULL,1," ' array' expected");
    NumArray* a= checkarrary(L);
    lua_pushinteger(L,a->size);
    return 1;
}
int array2string(lua_State *L)
{
    NumArray* a = checkarrary(L);
    lua_pushfstring(L,"array(%d)",a->size);
    return 1;
}

static const struct luaL_Reg arrylib_f[] = {
    {"new",newarray},
    {NULL,NULL}
};

//static const struct luaL_Reg arrylib_m[] = {
//    {"set",setarray },
//    {"get",getarray},
//    {"size",getsize},
//    {"__tostring",array2string},
//    {NULL,NULL}
//};

static const struct luaL_Reg arrylib_m[] = {
    {"__newindex",setarray },
    {"__index",getarray},
    {"__len",getsize},
    {"__tostring",array2string},
    {NULL,NULL}
};

int luaopen_mylib(lua_State *L)
{
    luaL_newmetatable(L,"LuaBook.array");
    lua_pushvalue(L,-1);
    lua_setfield(L,-1,"__index");
    luaL_setfuncs(L,arrylib_m,0);
    lua_newtable(L);
    luaL_setfuncs(L,arrylib_f,0);
    return 1;
}

//static int dir_iter(lua_State *L);

//static int l_dir(lua_State *L)
//{
//    const char *path = luaL_checkstring(L,1);

//    DIR **d = (DIR **)lua_newuserdata(L,sizeof(DIR *));

//    luaL_getmetatable(L,"LuaBook.dir");
//    lua_setmetatable(L,-2);

//    *d = opendir(path);
//    if(*d == NULL)
//    {
//        luaL_error(L,"cannot open %s: %s",path,strerror(errno));
//    }

//    lua_pushcclosure(L,dir_iter,1);
//    return 1;
//}


//static int dir_iter(lua_State *L)
//{
//    DIR *d = *(DIR **)lua_touserdata(L,lua_upvalueindex(1));
//    struct dirent *entry;
//    if((entry = readdir(d)) != NULL)
//    {
//        lua_pushstring(L,entry->d_name);
//        return 1;
//    }else
//   {
//        return 0;
//    }
//}

//static int dir_gc(lua_State *L)
//{
//    DIR *d = *(DIR**)lua_touserdata(L,1);
//    if(d)
//    {
//        closedir(d);
//    }
//    return 0;
//}


//int luaopen_dir(lua_State *L)
//{
//    luaL_newmetatable(L,"LuaBokk.dir");

//    lua_pushstring(L,"__gc");
//    lua_pushcfunction(L,dir_gc);
//    lua_settable(L,-3);

//    lua_pushcfunction(L,l_dir);
//    lua_setglobal(L,"dir");

//    return 0;
//}

#ifdef __cplusplus
}
#endif

#endif // LUACAPI_H
