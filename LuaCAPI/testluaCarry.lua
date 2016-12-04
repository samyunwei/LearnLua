#!/usr/bin/env lua
--# File Name: testluaCarry.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年12月01日 星期四 23时59分08秒
--#########################################################################

array = require "mylib"

a = array.new(1000)
--[[
print(a)
print(array.size(a))

for i = 1,1000 do
    array.set(a,i, i%5 == 0)
end

print(array.get(a,10))
--array.get(io.stdin,10)

print(a)
print(a:size())
--]]

a[10] = true
print(a[10])
print(#a)
