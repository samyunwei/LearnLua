#!/usr/bin/env lua
--# File Name: debuglua.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年11月17日 星期四 00时05分32秒
--#########################################################################
function traceback()
    for level = 1,math.huge do
        local info = debug.getinfo(level,"S1")
        if not info then break end
        if info.what == "c" then
            print(level,"C function")
        else
            print(string.format("[%s]:%d",info.shrt_src,info.currentline))
        end
    end
end



function foo(a,b)
    local x
    do local c = a-b end
    local a = 1
    while true do
        local name,value = debug.getlocal(1,a)
        if not name then break end
        print(name,value)
        a = a+1
    end
end


--foo(10,20)

function getvarvalue(name)
    local value,found

    for i = 1,math.huge do
        local n,v = debug.getlocal(2,i)
        if not n then break end
        if n == name then
            value = v
            found = true
            end
        end
        if found then return value end

        local func = debug.getinfo(2,"f").func
        for i = 1,math.huge do
            local n,v = debug.getupvalue(func,i)
            if not n then break end
            if n == name then return v end
        end
     return getfenv(func)[name]
 end

--[[
 co = coroutine.create(function()
     local x = 10
     coroutine.yield()
     error("some error")
 end)


 coroutine.resume(co)
 print(debug.traceback(co))
print(coroutine.resume(co))
print(debug.traceback(co))
print(debug.getlocal(co,1,1))

--]]
--[[
debug.sethook(print,"l")
a = 2

function trace(event,line)
    local s = debug.getinfo(2).short_src
    print(s .. ":" .. line)
end

debug.sethook(trace,"l")

a = 2

--]]


local Counters = {}
local Names = {}

local function hook()
    local f = debug.getinfo(2,"f").func
    if Counters[f] == nil then 
        Counters[f] = 1
        Names[f] = debug.getinfo(2,"Sn")
    else
        Counters[f] = Counters[f] + 1
    end
end


local f = assert(loadfile(arg[1]))
debug.sethook(hook,"c")
f()
debug.sethook()
function getname(func)
    local n = Names[func]
    if n.what == "C" then
        return n.name
    end
    local lc = string.format("[%s]:%s",n.short_src,n.linedefined)
    if n.namewhat ~= "" then
       return string.format("%s(%s)",lc,n.name)
   else
       return lc
   end
end


for func,count in pairs(Counters) do
    print(getname(func,count),count)
end






