#!/usr/bin/env lua
--# File Name: lualib.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年10月14日 星期五 00时09分54秒
--#########################################################################
--[[
local sin,asin = math.sin,math.asin
local deg,rad = math.deg,math.rad
math.sin = function(x) return sin(rad(x)) end
math.asin = function(x) return deg(asin(x)) end
math.randomseed(os.time())
--]]

--[[
t = {
    
}
for line in io.lines do
    table.insert(t,line)
end
print(#t)
--]]



--[[
lines = {
    luaH_set = 10,
    luaH_get = 24,
    luaH_present = 48,
}


a = {

}

for n in pairs(lines) do a[#a +1] = n end
table.sort(a)
for i,n in ipairs(a) do print(n) end


function pairsByKeys(t,f)
    local a = {
    }
    for n in pairs(t) do a[#a+1] = n end
    table.sort(a,f)
    local i = 0
    return function()
        i = i+1 --]]
--        return a[i],t[a[i]]
--[[
    end
end


for name,line in pairsByKeys(lines) do
    print(name,line)
end

--]]

--[[
function rconcat(l)
    if type(l) ~= "table" then return l end
    local res = {

    }
    for i =1,#l do
        res[i] = rconcat(l[i])
    end
    return table.concat(res)
end


print(rconcat{
    {
        " a",{" nice"}
    }," and",
    {

    
    {
        " long"
    },
    {
        " list"
    }
}
})

--]]

--[[
s = "[in brachkets]"
print(string.sub(s,2,-2))
--]]
--[[
print(string.char(97))
i = 99;
print(string.char(i,i+1,i+2))
print(string.byte("abc"))
print(string.byte("abc",2))
print(string.byte("abc",-1))
print(string.byte("abc",1,2))
--]]
--[[
print(string.format("pi = %.4f",math.pi))
d = 5;m = 11;y = 1990
print(string.format("%02d/%02d/%04d",d,m,y))
tag,title = "h1","a title"
print(string.format("<%s>%s</%s>",tag,title,tag))
--]]

--[[
s = "hello world"
i,j = string.find(s,"hello")
print(i,j)
print(string.sub(s,i,j))
print(string.find(s,"world"))
i,j = string.find(s,"l")
print(i,j)
print(string.find(s,"lll"))
--]]
--[[
function calcsentence(s)
local t = {

}

local i = 0
while true do
    i = string.find(s,"\n",i+1)
    if i == nil then break end
    t[#t+1] = i
end
end
--]]

--[[
print(string.match("hello world","hello"))

date= "Today is 17/7/1990"
d = string.match(date,"%d+/%d+/%d+")
print(d)

--]]

--[[
s = string.gsub("Lua is cute","cute","great")
print(s)
s = string.gsub("all lii","l","x")
print(s)
s = string.gsub("Lua is great","Sol","Sun")
print(s)
s = string.gsub("all lii","l","x",1)
s = string.gsub("all lii","l","x",1)
print(s)
s = string.gsub("all lii","l","x",2)
print(s)
--]]

--[[
words = {

}

for w in string.gmatch(s,"%a+") do
    words[#word+1] = w
end
--]]

--[[
function search(modname,path)
    modname = string.gsub(modname,"%.","/")
    for c in string.gmatch(path,"[^;]+") do
        local fname = string.gsub(c,"?",modname)
        local f = io.open(fname)
        if f then
            f:close()
            return fname
        end
    end
    return nil
end
--]]

--[[
print(string.gsub("hello, up-down!","%A","."))
print(string.gsub("one, and two;and three","%a+","word"))
print(string.match("the number 1298 is even","%d+"))

test = "int x;/* x */ int y; /* y */"
print(string.gsub(test,"/%*.*%*/","<COMMENT>"))
print(string.gsub(test,"/%*.-%*/","<COMMENT>"))

s = "a (enclosed (in) parenttheses) line"
print(string.gsub(s,"%b()",""))

--]]
--[[
pair = "name = Anna"
key,value = string.match(pair,"(%a+)%s*=%s*(%a+)")
print(key,value)


date = "Today is 17/7/1990"
d,m,y = string.match(date,"(%d+)/(%d+)/(%d+)")
print(d,m,y)


s = [[then he said:"it's all right"!]]
--[[
q,qutoedPart = string.match(s,"([\"'])(.-)%1")
print(qutoedPart)
print(q)


p = "%[(=*)%[(.-)%]%1%]"
--]]

--s = "a = [=[[[ something ]] ]==] ]=];print(a)"
--[[
print(string.match(s,p))

print(string.gsub("hello Lua!","%a","%0-%0"))

print(string.gsub("hello Lua","(.)(.)","%2%1"))

--]]
--[[
s = "the \\quote{task} is to \\em{change} that"
s = string.gsub(s,"\\(%a+){(.-)}","<%1>%2</%1>")
print(s)

function trim(s)
    return (string.gsub(s,"^%s*(.-)%s*$","%1"))
end

--]]

--[[
function expand(s)
    return (string.gsub(s,"$(%w+)",_G))
end

name = "Lua";status = "great"
print(expand("$name is $status,isn't it?'"))
print(expand("$othername is $status,isn't it?'"))

--]]
--[[
function expand(s)
    return (string.gsub(s,"$(%w+)",function(n)
        return tostring(_G[n])
    end))
end

print(expand("print = $print;a = $a"))
--]]
--[[
function toxml(s)
    s = string.gsub(s,"\\(%a+)(%b{})",function(tag,body)
        body = string.sub(body,2,-2)
        body = toxml(body)
        return string.format("<%s>%s</%s>",tag,body,tag)
    end)
    return s
end

print(toxml("\\title{The \\bold{big} example}"))
--]]
--[[
function unescape(s)
    s = string.gsub(s,"+"," ")
    s = string.gsub(s,"%%(%x%x)",function(h)
        return string.char(tonumber(h,16))
    end)
    return s
end

print(unescape("a%2Bb+%3D+c"))


cgi = {

}
function decode(s)
    for name,value in string.gmatch(s,"([^&=]+)=([^&=]+)") do
        name = unspace(name)
        value = unescape(value)
        cgi[name] = value
    end
end


function escape(s)
    s = string.gsub(s,"[&=+%%%c]",function (c)
        return string.format("%%%02X",string.byte(c))
    end)
    s = string.gsub(s," ","+")
    return s
end

function encode(t)
    local b = {

    }
    for k,v in pairs(t) do
        b[#b+1] = (escape(k) .. "=" .. escape(v))
    end
    return table.concat(b,"&")
end

t = {
    name = "al",
    query = "a+b = c",
    q = "yes or no"
}
print(encode(t))
--]]

print(string.match("hello","()ll()"))


function expandTabs(s,tab)
    tab = tab or 8
    local corr = 0
    s = string.gsub(s,"()\t",function(p)
        local sp = tab - (p -1 + corr) %tab
        corr = corr -1 +sp
        return string.rep(" ",sp)
    end)
    return s
end

function unexpandTabs(s,tab)
    tab = tab or 8
    s = expandTabs(s)
    local pat = string.rep(".",tab)
    s = string.gsub(s,pat,"%0\1")
    s = string.gsub(s," +\1","\t")
    s = string.gsub(s,"\1","")
    return s
end

