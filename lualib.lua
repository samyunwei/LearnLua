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


t = {
    
}
for line in io.lines do
    table.insert(t,line)
end
print(#t)
