#!/usr/bin/env lua
--# File Name: testLuaCAPI.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年11月28日 星期一 22时18分35秒
--#########################################################################
local mylib = require "mylib"
print(type(mylib))
print(mylib.sin(1))

