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
--[[
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
--]]

--[[
function printResult(a)
    for i = 1,#a do
        io.write(a[i]," ")
    end
    io.write("\n")
end

function permgen(a,n)
    n = n or #a
    if n <= 1 then 
        printResult(a)
    else
        for i = 1,n do
            a[n],a[i] = a[i],a[n]
            permgen(a,n-1)
            a[n],a[i] = a[i],a[n]
        end
    end
end

permgen({
    1,2,3,4
})
--]]
--[[
function permgen(a,n)
    n = n or #a
    if n <= 1 then 
       coroutine.yield(a) 
    else
        for i = 1,n do
            a[n],a[i] = a[i],a[n]
            permgen(a,n-1)
            a[n],a[i] = a[i],a[n]
        end
    end
end

function permutations(a)
    local co = coroutine.create(function() permgen(a) end)
    return function() 
        local code,res = coroutine.resume(co)
        return res
    end
end

function permutations (a)
    return coroutine.wrap(function() permgen(a) end)
end
function printResult(a)
    for i = 1,#a do
        io.write(a[i]," ")
    end
    io.write("\n")
end


for p in permutations{"a","b","c"} do
    printResult(p)
end

--]]
--[[
socket = require("socket")
host = "www.w3.org"
file = "/TR/REC-html.html"
c = assert(socket.connect(host,80))
c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
while true do
    local s,status,partial = c:receive(2^10)
    io.write(s or partial)
    if status == "closed" then break end
end
c:close()
--]]

socket = require("socket")

function receive(connection)
    connection:settimeout(0)
    local s,status,partial = connection:receive(2^10)
    if status == "timeout" then
        coroutine.yield(connection)
    end
    return s or partial,status
end


function download(host,file)
    local c = assert(socket.connect(host,80))
    local count = 0
    c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
    while true do
        local s,status,partial = receive(c)
        count = count + #(s or partial)
        if status == "closed" then break end
    end
    c:close()
    print(file,count)
end

function get(host,file)
    local co = coroutine.create(function()
        download(host,file)
    end)
    table.insert(threads,co)
end


function dispatch()
    local i = 1
    while true do
        if threads[i] == nil then
            if threads[1] == nil then break end
            i = 1
        end
        local status,res = coroutine.resume(threads[i])
        if not res then
            table.remove(threads,i)
        else
                i = i+1
        end
    end
end

function dispatch2()
    local i = 1
    local connections = {}
    while true do
        if threads[i] == nil then
            if threads[1] == nil then break end
            i = 1
            connections = {}
        end
        local status ,res = coroutine.resume(threads[i])
        if not res then
            table.remove(threads,i)
        else
            i = i+1
            connections[#connections + 1] = res
            if #connections == #threads then
                socket.select(connections)
            end
        end
    end
end


threads = {}


host = "www.w3.org"

get(host,"/TR/html401/html40.txt")
get(host,"TR/2002/REC-xhtml1-20020801/xhtml1.pdf")
get(host,"/TR/REC-html.html")
get(host,"TR/2000/REC-DOM-Level-2-Core-20001113/DOM2-Core.txt")

dispatch2()
--[[
test = {

}
function inner()
    local i = 1
    print(i)
    i = i+1
end

function test2()
    local co = coroutine.create(function()
        inner()
        print("this is test")
    end)
    table.insert(test,co)
end
test2()
print(coroutine.resume(test[1]))
--]]
