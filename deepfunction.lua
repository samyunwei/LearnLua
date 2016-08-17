#!/usr/bin/env lua
--# File Name: deepfunction.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 三  8/17 23:10:04 2016
--#########################################################################
--[[
a = {
    p = print
}

a.p("Hello World")
print = math.sin
a.p(print(1))
sin = a.p
sin(10,20)
--]]


function derivative(f,delta)
    delta = delta or 1e-4
    return function(x)
            return (f(x+delta) - f(x)) /delta
        end
end

c = derivative(math.sin)
print(math.cos(10),c(10))

