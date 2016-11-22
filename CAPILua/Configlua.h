#ifndef CONFIGLUA_H
#define CONFIGLUA_H

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


void load(lua_State *L,const char* fname,int * w,int* h);

#ifdef __cplusplus
}
#endif

#endif // CONFIGLUA_H

