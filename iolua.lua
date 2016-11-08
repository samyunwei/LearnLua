#!/usr/bin/env lua
--# File Name: iolua.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年11月07日 星期一 23时39分11秒
--#########################################################################
io.write("sin(3) = ",math.sin(3),"\n")
io.write(string.format("sin (3) = %.4f\n",math.sin(3)))
print("hello","Lua");print("Hi")
io.write("hello","Lua");io.write("Hi")
--[[
t = io.read("*all")
t = string.gsub(t,"[(\128-\255)=]",function(c)
    return string.format("=%02X",string.byte(c))
end)
io.write(t)
--]]

--[[
for count = 1,math.huge do
    local line =io.read()
    if line == nil then break end
    io.write(string.format("%6d",count),line,"\n")
end

--]]
--[[
local lines = {}

for line in io.lines() do lines[#line + 1] = line end
table.sort(lines)
for _,l in ipairs(lines) do io.write(l,"\n") end

--]]

--[[
while true do
    local n1,n2,n3 =io.read("*number","*number","*number")
    if not n1 then break end
    print(math.max(n1,n2,n3))
end
--]]

--[[
local pat = "(%S+)%s+(%S+)%s+(%S+)%s+"
for n1,n2,n3 in string.gmatch(io.read("*all"),pat) do
    print(math.max(tonumber(n1),tonumber(n2),tonumber(n3)))
end
---]]


while true do
    local block = io.read(2^13)
    if not block then break end
    io.write(block)
end

