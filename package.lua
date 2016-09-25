#!/usr/bin/env lua
--# File Name: package.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 六  9/24 11:11:31 2016
--#########################################################################
--[[
local modname = "complex"
local M = {

}
_ENV[modname] = M
package.loaded[modname] = M

setmetatable(M,{
    __index = _ENV
})

local sqrt = math.sqrt
local io =  io
local _ENV = M



function M.new(r,i) 
    return {r = r, i = i}
end

M.i = M.new(0,1)

 function M.add(c1,c2)
     return M.new(c1.r + c2.r,c1.i+c2.i)
 end



function M.mul(c1,c2)
    return M.new(c1.r*c2.r -c1.i*c2.i,c1.r*c2.i + c1.i*c2.r)
end

local function inv(c)
    local n = c.r ^ 2 + c.i ^ 2
    return M.new(c.r/n,-c.i/n)
end

function M.div(c1,c2)
    return M(c1,inv(c2))
end

--]]

module("complex")

function new(r,i) 
    return {r = r, i = i}
end

i = new(0,1)

 function add(c1,c2)
     return new(c1.r + c2.r,c1.i+c2.i)
 end



function mul(c1,c2)
    return new(c1.r*c2.r -c1.i*c2.i,c1.r*c2.i + c1.i*c2.r)
end

local function inv(c)
    local n = c.r ^ 2 + c.i ^ 2
    return new(c.r/n,-c.i/n)
end

function div(c1,c2)
    return c1,inv(c2)
end



