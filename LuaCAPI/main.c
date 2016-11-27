/*************************************************************************
	> File Name: main.c
	> Author: Sam
	> Mail: samyunwei@163.com 
	> Created Time: 六 11/26 21:44:25 2016
 ************************************************************************/

#include <stdio.h>
#include <lua.h>
#include <luaxlib.h>
#include <lualib.h>
#include <math.h>
static int l_sin(lua_State *L)
{
    double d = lua_tonumber(L,1);
    lua_pushnumber(L,sin(d));
    return 1
}
int main(void)
{
    printf("%s","hello world!");
    return 0;
}
