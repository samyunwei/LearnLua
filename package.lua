#!/usr/bin/env lua
--# File Name: package.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 六  9/24 11:11:31 2016
--#########################################################################
complex = {

}

function complex.new(r,i) return {r = r, i = i}
end

complex.i = complex.new(0,1)

 
