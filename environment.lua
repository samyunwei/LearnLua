#!/usr/bin/env lua
--# File Name: environment.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年09月19日 星期一 23时59分09秒
--#########################################################################

for n in pairs(_G) do print(n) end

function getfield(f)
    local v = _G
    for w in string.gmatch(f,"[%w_]+") do
        v = v[w]
    end
    return v
end


function setfield(f,v)
    local t = _G
    for w,d in string.gmatch(f,"([%w_]+)(%.?)") do
        if d == "." then
            t[w] = t[w] or {}
            t = t[w]
        else
            t[w] = v
        end
    end
end



setfield("t.x.y",10)

print(t.x.y)
print(getfield("t.x.y"))
