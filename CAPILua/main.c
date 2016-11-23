#include "Configlua.h"


void test_newState(void)
{
        printf("Hello World!\n");
        char buff[256];
        int error;
        lua_State *L = luaL_newstate();
        luaL_openlibs(L);
        while(fgets(buff,sizeof(buff),stdin) != NULL)
        {
            error = luaL_loadbuffer(L,buff,strlen(buff),"line") || lua_pcall(L,0,0,0);
            if(error)
            {
                fprintf(stderr,"%s",lua_tostring(L,-1));
                lua_pop(L,1);
            }
        }
        lua_close(L);
}

void testStack(void)
{
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
}

void testConfig(void)
{
    lua_State *L = luaL_newstate();
    int i = 0;
    while(colortable[i].name != NULL)
    {
        setcolor(L, &colortable[i++]);
    }
}

int main(void)
{

    return 0;
}
