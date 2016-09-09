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

--[[
local authors = {
}

function Entry(b) 
    if b.author then authors[b.author] = true end
end
dofile("data2.lua")
for name in pairs(authors) do print(name) end
--]]

--[[
function quote(s)
    local n = -1
    for w in string.gmatch(s,"]=*") do
        n = math.max(n,#w-1)
    end
    
    local eq = string.rep("=",n+1)

    return string.format(" [%s[\n%s]%s]",eq,s,eq)
end

--]]

function serialize(o)
    if type(o) == "number" then
        io.write(o)
    elseif type(o) == "string" then
        io.write(string.format("%q",o))
    elseif type(o) == "table" then
        io.write("{\n")
        for k,v in pairs(o) do
--            io.write(" ",k," = ")
            io.write(" [")
            serialize(k)
            io.write("] = ")
            serialize(v)
            io.write(",\n")
        end
        io.write("}\n")
    else
        error("can not serialize a" .. type(o))
    end
end


--serialize{
--    a=12,b='lua',key = 'another "one" '
---}

function basicSerialize(o)
    if type(o) == "number" then
        return tostring(o)
    else 
        return string.format("%q",o)
    end
end


function save(name,value,saved)
    saved = saved or {}
    io.write(name, " = ")
    if type(value) == "number" or type(value) == "string" then
        io.write(basicSerialize(value),"\n")
    elseif type(value) == "table" then
        if saved[value] then
            io.write(saved[value],"\n")
        else
            saved[value] = name
            io.write("{}\n")
            for k,v in pairs(value) do
                k = basicSerialize(k)
                local fname = string.format("%s[%s]",name,k)
                save(fname,v,saved)
                end
            end
    else
        error("cannot save a" .. type(value))
    end
end


a = {
    x = 1,
    y = 2;
    {
        3,4,5
    }
}

a[2] = a
a.z = a[1]

save("a",a)



