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



