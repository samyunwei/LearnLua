#ifndef LUAXML_H
#define LUAXML_H
#ifdef __cplusplus
extern "C" {
#endif
#include <stdlib.h>
#include <lua.h>
#include <expat.h>
#include <lauxlib.h>

typedef struct lxp_userdata{
    lua_State *L;
    XML_Parser parser;
}lxp_userdata;


static void f_startElement(void *ud,const char  *name,const char **atts);
static void f_CharData(void *ud,const char* s,int len);
static void f_endElement(void *ud,const char * name);

static int lxp_makeparser(lua_State *L)
{
    XML_Parser p;
    lxp_userdata *xpu;

    xpu = (lxp_userdata *)lua_newuserdata(L,sizeof(lxp_userdata));

    xpu->parser = NULL;

    luaL_getmetatable(L,"Expat");
    lua_setmetatable(L,-2);

    p = xpu->parser = XML_ParserCreate(NULL);
    if(!p)
    {
        luaL_error(L,"XML_ParserCreate faild");
    }

    luaL_checktype(L,1,LUA_TTABLE);
    lua_pushvalue(L,1);
    lua_setglobal(L,"__ENV");

    XML_SetUserData(p,xpu);
    XML_SetElementHandler(p,f_startElement,f_endElement);
    XML_SetCharacterDataHandler(p,f_CharData);
    return 1;
}

static void f_startElement(void *ud,const char  *name,const char **atts)
{

}

static void f_CharData(void *ud,const char* s,int len)
{

}

static void f_endElement(void *ud,const char * name)
{

}

#ifdef __cplusplus
}
#endif
#endif // LUAXML_H
