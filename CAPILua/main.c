#include <stdio.h>
#include <string.h>
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include <stdarg.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif
static void stackDump(lua_State *L)
{
    int i;
    int top = lua_gettop(L);
    for(i =1;i<= top;i++)
    {
        int t = lua_type(L,i);
        switch(t)
        {
        case LUA_TSTRING:
        {
            printf(" '%s' ",lua_tostring(L,i));
            break;
        }
           case LUA_TBOOLEAN:
        {
            printf(lua_toboolean(L,i) ? "true" : "false");
            break;
        }
        case LUA_TNUMBER:
        {
            printf("%g",lua_tonumber(L,i));
            break;
        }
        default:
        {
            printf("%s",lua_typename(L,t));
            break;
        }
        }
            printf(" ");
    }
        printf("\n");
}
int main(void)
{
//    printf("Hello World!\n");
//    char buff[256];
//    int error;
//    lua_State *L = luaL_newstate();
//    luaL_openlibs(L);
//    while(fgets(buff,sizeof(buff),stdin) != NULL)
//    {
//        error = luaL_loadbuffer(L,buff,strlen(buff),"line") || lua_pcall(L,0,0,0);
//        if(error)
//        {
//            fprintf(stderr,"%s",lua_tostring(L,-1));
//            lua_pop(L,1);
//        }
//    }

//    lua_close(L);
    lua_State *L = luaL_newstate();

    lua_pushboolean(L,1);
    lua_pushnumber(L,10);
    lua_pushnil(L);
    lua_pushstring(L,"hello");

    stackDump(L);

    lua_pushvalue(L,-4);
    stackDump(L);

    lua_replace(L,3);
    stackDump(L);

    lua_settop(L,6);
    stackDump(L);

    lua_remove(L,-3);
    stackDump(L);

    lua_settop(L,-5);
    stackDump(L);

    lua_close(L);


    return 0;
}

//void error(lua_State *L,const char *fmt, ...)
//{
//    va_list argp;
//    va_start(argp,fmt);
//    vfprintf(stderr,fmt,argp);
//    va_end(argp);
//    lua_close(L);
//    exit(EXIT_FAILURE);
//}



#ifdef __cplusplus
}
#endif
