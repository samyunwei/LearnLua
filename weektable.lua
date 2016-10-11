#!/usr/bin/env lua
--# File Name: weektable.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 日 10/ 2 23:47:47 2016
--#########################################################################
--[[
a = {

}
b = {
    __mode = 'k'
}

setmetatable(a,b)
key = {

}

a[key] = 1

key = {

}
a[key] = 2
collectgarbage()
for k,v in pairs(a) do print(v) end 
--]]

--[[
local result = {

}
setmetatable(result,{
    __mode = 'kv'
})
function mem_loadstring(s)
    local res = result[s]
    if res == nil then
        res = assert(loadstring(s))
        result[s] = res
    end
    return res
end
--]]

--[[
local res = {

}

setmetatable(result,{
    __mode = 'v'
})
function createRGB(r,g,b)
    local key = r .. '-' .. '-'.. b
    local color = result[key]
    if color == nil then
        color = [red = r, green = g,blue = b]
        result[key] = color
    end
    return color
end
--]]

--[[

local default = {
}

setmetatable(default,{
    __mode = "k"
})
local mt = {
    __index = function(t) return default[t] end
}
function setDefalut(t,d)
    default[t] = d
    setmetatable(t,mt)
end

--]]


local metas = {
}

setmetatable(metas,{
    __mode = 'v'
})
function setDefalut(t,d)
    local mt = metas[d]
    if mt == nil then
        mt = {
            __index = function() return d end
        }
        metas[d] = mt
    end
    setmetatable(t,mt)
end
