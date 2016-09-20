#!/usr/bin/env lua
--# File Name: environment.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年09月19日 星期一 23时59分09秒
--#########################################################################
--[[
for n in pairs(_G) do print(n) end

function getfield(f)
    local v = _G
    for w in string.gmatch(f,"[%w_]+") do
        v = v[w]
    end
    return v
end


function setfield(f,v)
    local t = _G
    for w,d in string.gmatch(f,"([%w_]+)(%.?)") do
        if d == "." then
            t[w] = t[w] or {}
            t = t[w]
        else
            t[w] = v
        end
    end
end



setfield("t.x.y",10)

print(t.x.y)
print(getfield("t.x.y"))
--]]

--[[
setmetatable(_G,{
    __newindex = function(_,n)
        error("attempt to write to undelcared variable" .. n,2)
    end
    ,
    __index = function(_,n)
        error("attempt to read undelcared variable" .. n,2)
    end
})

print(a)

--]]
--[[
local declaredNames = {
}
setmetatable(_G,{
    __newindex = function(t,n,v)
        if not declaredNames[n] then 
            local w = debug.getinfo(2,"s").what
            if w ~= "main" and w~= "c" then
                error("attempt to write to undelcared variable" .. n,2)
            end
            declaredNames[n] = true
        end
        rawset(t,n,v)
    end
    ,
    __index = function(_,n)
        if not declaredNames[n] then
            error("attempt to read undelcared variable" .. n,2)
        else
            return nil
        end
    end
})
--]]
--[[
testenv = {
 a = 1
}
setmetatable(testenv,{
    __index = _G
})
testenv.print(testenv.a)
--]]
--[[
a = 1
local newgt = {
}
setmetatable(newgt,{
    __index = _G
})
_ENV = newgt
print(a)
a = 10
print(a)
print(_G.a)
_G.a = 20
print(_G.a)
--]]

function factory()
    return function(env)
        local _ENV = _ENV
        if env then
             _ENV = env
        end
        return a
    end
end

a = 3
f1 = factory()
f2 = factory()
print(f1())
print(f2())

print(f1({a = 10}))
print(f2())
