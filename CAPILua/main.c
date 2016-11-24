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
    int res = luaL_loadstring(L,"background = \"WHITE\" ");
    lua_pcall(L,0,0,0);
    if(res)
    {
        printf("error %d",1);
    }
    while(colortable[i].name != NULL)
    {
        setcolor(L, &colortable[i++]);
    }

    lua_getglobal(L,"background");
    unsigned char red,blue,green;
    if(lua_isstring(L,-1))
    {
        const char *colorname = lua_tostring(L,-1);
        int i = 0;
        for(i = 0;colortable[i].name != NULL;i++)
        {
            if(strcmp(colorname,colortable[i].name) == 0)
            {
                break;
            }
        }

        if(colortable[i].name == NULL)
        {
            error(L,"invalid color name(%s)",colorname);
        }else
        {
            red = colortable[i].red;
            green = colortable[i].green;
            blue = colortable[i].blue;
            printf("setsuccess: %s",colorname);
        }
    }else if(lua_istable(L,-1))
    {
        red = getfield(L,"r");
        green = getfield(L,"g");
        blue = getfield(L,"b");
    }else
    {
        error(L,"invalid value for 'background' ");
    }
    lua_close(L);
}

double f(lua_State *L,double x,double y)
{
    double z;
    lua_getglobal(L,"f");
    lua_pushnumber(L,x);
    lua_pushnumber(L,y);
    if(lua_pcall(L,2,1,0) != 0)
    {
        error(L,"error running 'f' : %s",lua_tostring(L,-1));
    }

    if(!lua_isnumber(L,-1))
    {
        error(L,"function 'f' must return a number" );
    }
    z = lua_tonumber(L,-1);
    lua_pop(L,-1);
    return z;
}

void testFunc(void)
{
    lua_State *L = luaL_newstate();
    luaL_openlibs(L);
    luaL_loadstring(L," function f (x,y) return (x^2 * math.sin(y)) / (1-x) end ");
    lua_pcall(L,0,0,0);
    printf("f res = %f",f(L,0,1));
    lua_close(L);
}

int main(void)
{
    testFunc();
    return 0;
}
