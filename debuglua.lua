#!/usr/bin/env lua
--# File Name: debuglua.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年11月17日 星期四 00时05分32秒
--#########################################################################
function traceback()
    for level = 1,math.huge do
        local info = debug.getinfo(level,"S1")
        if not info then break end
        if info.what == "c" then
            print(level,"C function")
        else
            print(string.format("[%s]:%d",info.shrt_src,info.currentline))
        end
    end
end


