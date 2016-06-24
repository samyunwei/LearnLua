#!/usr/bin/env lua
--# File Name: fact.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 六  6/25 01:06:35 2016
--#########################################################################
function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end


print ("Enter a number:")
a = io.read("*number")
print(fact(a))
