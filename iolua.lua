#!/usr/bin/env lua
--# File Name: iolua.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年11月07日 星期一 23时39分11秒
--#########################################################################
--[[
io.write("sin(3) = ",math.sin(3),"\n")
io.write(string.format("sin (3) = %.4f\n",math.sin(3)))
print("hello","Lua");print("Hi")
io.write("hello","Lua");io.write("Hi")

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

--[[
while true do
    local block = io.read(2^13)
    if not block then break end
    io.write(block)
end
--]]
--[[
print(io.open("non-existent-file",'r'))
print(io.open("/etc/passwd",'w'))

local f = assert(io.open(filename,mode))

local f = assert(io.open(filename,"r"))
local t = f:read("*all")
f:close()
io.stderr:write(message)

--]]
--[[
local temp = io.input()
io.input("newinput")
io.input():close()
io.input(temp)
--]]

--[[
local BUFSIZE = 2^13
local f = io.input(arg[1])
local cc,lc,wc = 0,0,0
while true do
    local lines,reset = f:read(BUFSIZE,"*line")
    if not lines then break end
    if reset then lines = lines .. reset .. '\n' end
    cc = cc+ #lines
    local _,t =string.gsub(lines,"%S+","")
    wc = wc + t
    _,t = string.gsub(lines,"\n","\n")
    lc = lc+t
end
print(lc,wc,cc)

--]]

--[[
local inp = assert(io.open(arg[1],"rb"))
local out = assert(io.open(arg[2],'wb'))

local data = inp:read("*all")
data = string.gsub(data,"\r\n","\n")
out:write(data)

assert(out:close())


--]]

--[[
local f = assert(io.open(arg[1],"rb"))
local data = f:read("*all")
local validchars = "%[%w%p%s]"
local pattern = string.rep(validchars,6) .. "+%z"
for w in string.gmatch(data,pattern) do
    print(w)
end
--]]

--[[
local f = assert(io.open(arg[1],"rb"))
local block = 16
while true do
    local bytes = f:read(block)
    if not bytes then break end
    for _,b in ipairs{string.byte(bytes,1,-1)} do
        io.write(string.format("%02X",b))
    end
    io.write(string.rep("  ",block -string.len(bytes)))
    io.write(" ",string.gsub(bytes,"%c","."),"\n")
end
--]]


function fsize(file)
    local current = file:seek()
    local size = file:seek("end")
    file:seek("set",current)
    return size
end
