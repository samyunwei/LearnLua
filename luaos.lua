#!/usr/bin/env lua
--# File Name: luaos.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年11月15日 星期二 23时58分18秒
--#########################################################################
print(os.time{
    year = 1970,month = 1,day = 1,hour = 0
})
print(os.time{
    year = 1970,month = 1,day = 1,hour = 0,sec = 1
})
print(os.time{
    year = 1970,month = 1,day = 1
})
print(os.date("today is %A,in %B"))
print(os.date("%x",906000490))
local x = os.clock()
local s = 0
for i = 1,10000 do s = s + i end
print(string.format("elapsed time: %.2f\n",os.clock() - x))
