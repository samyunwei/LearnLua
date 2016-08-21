#!/usr/bin/env lua
--# File Name: compile.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年08月21日 星期日 16时24分48秒
--#########################################################################
--[[
i = 0
f = loadstring("i = i+1")
f()
print(i)
f()
print(i)
--]]

--[[
i = 32
local i = 0
f = loadstring("i = i+1;print(i)")
g = function() i = i+1;print(i) end
f()
g()

--]]

--[[
print "enter you expression:\n"
local l = io.read()
local func = assert(loadstring("return ".. l ))
print("the value of your expression is " .. func())
--]]

--[[
print "enter function to be plotted (with variable:x)"
local l = io.read()
local f = assert(loadstring("return ".. l))
for i =1,20 do
    x = i
    print(string.rep("*",f()))
end

--]]
--[[
f = loadstring("local a = 10;print(a+20)")
f()


print "enter function to be plotted (with variable:x)"
local l = io.read()
local f = assert(loadstring("local x = ...;return ".. l))
for i =1,20 do
    print(string.rep("*",f(i)))
end
-]]

--print(loadstring("i i"))
--[[
print "enter a number:"
n =io.read("*number")
if not n then error("invalid input") end
--]]
--[[
print "enter a number"
n = assert(io.read("*number"),"invalid input")
--]]

--[[
local file,msg
repeat
    print "enter a file name:"
    local name = io.read()
    if not name then return end
    file,msg = io.open(name,"r")
    if not file then print(msg) end
until file
--]]
--[[
local status,err = pcall(function() error ({
    code = 121
}) end)
print(err.code)

--]]

function foo(str)
    if type(str) ~= "string" then
        error("string")
    end
    print("success")
end

if pcall(foo,"str") then
    print "success2"
else
    print "error"
end
