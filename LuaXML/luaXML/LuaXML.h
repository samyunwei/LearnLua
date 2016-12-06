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

static int lxp_parse(lua_State *L)
{
    int status;
    size_t len;
    const char* s;
    lxp_userdata *xpu;

    xpu = (lxp_userdata*)luaL_checkudata(L,1,"Expat");

    s = luaL_optlstring(L,2,NULL,&len);

    lua_settop(L,2);

    lua_getglobal(L,"__ENV");
    xpu->L = L;

    status = XML_Parse(xpu->parser,s,(int )len,s == NULL);

    lua_pushboolean(L,status);
    return 1;
}

static void f_startElement(void *ud,const char  *name,const char **atts)
{
    lxp_userdata *xpu = (lxp_userdata*)ud;
    lua_State *L = xpu->L;

    lua_getfield(L,3,"StartElement");
    if(lua_isnil(L,-1))
    {
        lua_pop(L,1);
        return;
    }

    lua_pushvalue(L,1);
    lua_pushstring(L,name);

    lua_newtable(L);
    for(;*atts;atts +=2)
    {
        lua_pushstring(L,*(atts+1));
        lua_setfield(L,-2,*atts);
    }

    lua_call(L,3,0);
}

static void f_CharData(void *ud,const char* s,int len)
{
    lxp_userdata *xpu = (lxp_userdata*)ud;
    lua_State *L = xpu->L;

    lua_getfield(L,3,"CharacterData");
    if(lua_isnil(L,-1))
    {
        lua_pop(L,1);
        return;
    }

    lua_pushvalue(L,1);
    lua_pushlstring(L,s,len);
    lua_call(L,2,0);
}

static void f_endElement(void *ud,const char * name)
{
    lxp_userdata *xpu = (lxp_userdata *)ud;
    lua_State *L = xpu->L;

    lua_getfield(L,3,"EndElement");
    if(lua_isnil(L,-1))
    {
        lua_pop(L,1);
        return;
    }

    lua_pushvalue(L,1);
    lua_pushstring(L,name);
    lua_call(L,2,0);
}


static int lxp_close(lua_State *L)
{
    lxp_userdata *xpu = (lxp_userdata*)luaL_checkudata(L,1,"Expat");

    if(xpu->parser)
    {
        XML_ParserFree(xpu->parser);
    }
    xpu->parser = NULL;
    return 0;
}


static const struct luaL_Reg lxp_meths[] = {
  {"parese",lxp_parse},
  {"close",lxp_close},
  {"__gc",lxp_close},
  {"NULL",NULL}
};


static const struct luaL_Reg lxpfuncs[] = {
    {"new",lxp_makeparser},
    {"NULL",NULL}
};


int luaopen_lxp(lua_State *L)
{
    luaL_newmetatable(L,"Expat");

    lua_pushvalue(L,-1);
    lua_setfield(L,-2,"__index");

    luaL_setfuncs(L,lxp_meths,0);

    lua_newtable(L);
    luaL_setfuncs(L,lxpfuncs,0);
    return 1;
}

#ifdef __cplusplus
}
#endif
#endif // LUAXML_H
