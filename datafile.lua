#!/usr/bin/env lua
--# File Name: datafile.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年09月07日 星期三 23时56分26秒
--#########################################################################
--[[
local count = 0
function Entry(_) count = count + 1 end
dofile("data.lua")
print("number of entries:" .. count)
--]]

--local author = {
--}
--
--function Entry(b) author[b[1]] = true end
--dofile("data.lua")
--for name in pairs(author) do print(name) end
--


local authors = {
}

function Entry(b) 
    if b.author then authors[b.author] = true end
end
dofile("data2.lua")
for name in pairs(authors) do print(name) end

