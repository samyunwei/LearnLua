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


void call_va(lua_State *L,const char *func,const char *sig, ...)
{
    va_list vl;
    int narg,nres;
    va_start(vl,sig);
    lua_getglobal(L,func);
    //push arg
    for(narg = 0;*sig;narg++)
    {
        lua_checkstack(L,1);
        switch (*sig++) {
        case 'd':
            lua_pushnumber(L,va_arg(vl,double));
            break;
        case 'i':
            lua_pushinteger(L,va_arg(vl,int));
            break;
        case 's':    nres = strlen(sig);

            if(lua_pcall)
                lua_pushstring(L,va_arg(vl,char *));
            break;
        case '>':
            goto endarg;
        default:
            error(L,"invalid option (%c)",*(sig-1));
            break;
        }
    }
endarg:

    nres = strlen(sig);

    if(lua_pcall(L,narg,nres,0) != 0)
    {
        error(L,"error calling '%s' : '%s' ",func,lua_tostring(L,-1));
    }
    va_end(vl);

    //select res
    nres = -nres;
    while(*sig)
    {
        switch(*sig++)
        {
        case 'd':
            if(!lua_isnumber(L,nres))
            {
                error(L,"wrong result type");
            }
            *va_arg(vl,double *) = lua_tonumber(L,nres);
            break;
        case 'i':
            if(!lua_isinteger(L,nres))
            {
                error(L,"wrong result type");
            }
            *va_arg(vl,int *) = lua_tointeger(L,nres);
            break;
        case 's':
            if(!lua_isstring(L,nres))
            {
                error(L,"wrong result type");
            }
            *va_arg(vl,const char **) = lua_tostring(L,nres);
            break;
        default:
            error(L,"invalid option (%c)",*(sig - 1));
        }
        nres++;
    }
}
