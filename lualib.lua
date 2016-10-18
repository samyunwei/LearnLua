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


s = "[in brachkets]"
print(string.sub(s,2,-2))
