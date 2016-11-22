#ifndef CLUAAPI
#define CLUAAPI

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


void stackDump(lua_State *L);
void error(lua_State *L,const char *fmt, ...);

#ifdef __cplusplus
}
#endif

#endif // CLUAAPI

