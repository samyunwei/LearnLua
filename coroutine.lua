#!/usr/bin/env lua
--# File Name: coroutine.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年08月22日 星期一 23时41分19秒
--#########################################################################
co = coroutine.create(function () print("hi") end)
print(co)

print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
