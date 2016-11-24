#ifndef CONFIGLUA_H
#define CONFIGLUA_H
#define MAX_COLOR 255
#ifdef __cplusplus
extern "C" {
#endif
#include <stdio.h>
#include <string.h>
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include <stdarg.h>
#include <stdlib.h>
#include "CLuaAPI.h"


#ifndef __COLORENV
#define __COLORENV
static struct ColorTable
{
    char *name;
    unsigned char red,green,blue;
}colortable[ ] = {
{"WHITE" ,MAX_COLOR,MAX_COLOR,MAX_COLOR},
{"RED",MAX_COLOR,0,0},
{"GREEN",0,MAX_COLOR,0},
{"BLUE",0,0,MAX_COLOR},
{"NULL",0,0,0}
};
#endif

void setfield(lua_State *L,const char *index,int value);
void load(lua_State *L,const char* fname,int * w,int* h);
int getfield(lua_State *L,const char *key);
void setcolor(lua_State *L,struct ColorTable *ct);
void call_va(const char *func,const char *sig,...);
#ifdef __cplusplus
}
#endif

#endif // CONFIGLUA_H

