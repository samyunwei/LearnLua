#!/usr/bin/env lua
--# File Name: coroutine.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年08月22日 星期一 23时41分19秒
--#########################################################################
--[[
co = coroutine.create(function () print("hi") end)
print(co)

print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
--]]
--[[
co = coroutine.create(function() for i = 1,10 do 
    print("co",i)
    coroutine.yield()
end
end)

coroutine.resume(co)
print(coroutine.status(co))
for i = 1,10 do
    coroutine.resume(co)
end
print(coroutine.resume(co))
--]]

--[[
co = coroutine.create(function(a,b,c) 
    print("co",a,b,c)
end)

coroutine.resume(co,1,2,3)
--]]
--[[
co = coroutine.create(function(a,b)
    print("co",coroutine.yield(a+b,a-b))
end)

print(coroutine.resume(co,10,20))
--]]
--[[
co = coroutine.create(function()
    print("co",coroutine.yield())
end)
coroutine.resume(co)
coroutine.resume(co,4,5)
--]]
--[[
co = coroutine.create(function()
    return 6,7
end)
print(coroutine.resume(co))

--]]

function receive(prod)
    local status,value = coroutine.resume(prod)
    return value
end

function send(x)
    coroutine.yield(x)
end

function producer()
    return coroutine.create(function()
        while true do
            local x = io.read()
            send(x)
        end
    end)
end


function filter(prod)
    return coroutine.create(function()
        for line = 1,math.huge do
            local x = receive(prod)
            x = string.format("%5d %s",line,x)
            send(x)
        end
    end)
end



function consumer(prod)
    while true do
        local x =receive(prod)
        io.write(x,"\n")
    end
end


p = producer()
f = filter(p)
consumer(f)
