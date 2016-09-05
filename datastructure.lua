#!/usr/bin/env lua
--# File Name: datastructure.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 二  8/30 23:53:26 2016
--#########################################################################
--[[
a = {}
for i = 1,1000 do
    a[i] = 0
end

print(#a)

a = {}
for i = -5,5 do
    a[i] = 0
end

squares = {1,4,9,16,25,36,49,64,81}

mt = {
}
M = 1;N=1
for i = 1,N do
    mt[i] = {
    }
    for j = 1,M do
        mt[i][j]  =0
    end
end

mt ={
}
for i = 1,N do
    mt[i] = {
    }
    for j = 1,i do
        mt[i][j]  =0
    end
end

function mult(a,rowindex,k)
    local row = a[rowindex]
    for i,v in pairs(row) do 
        row[i] = v * k
    end
end

list = nil
list = {
    next = list,
    value = 1
}
--]]
--[[
List = {

}

function List.new()
    return {
        first = 0,last = -1
    }
end

function List.pushfirst(last,value)
    local first = list.first-1
    list.first = first
    list[first] = value
end


function List.pushlast(list,value)
    local last = last.last +1
    list.last = last
    list[last] = value
end

function List.popfirst(list)
    local first =list.first
    if first > list.last then error("list is empty") end
    local value = list[first]
    list[first] = nil
    list.first = first +1
    return value
end

function List.poplast(list)
    local last = list.last
    if last < list.first then error("list is empty") end
    local value = list[last]
    list[last] = nil
    list.last = last -1
    return value
end


--]]
--[[
function Set(list)
    local set = {

    }
    for k,l in ipairs(list) do set[l] = true end
    return set
end

reserved = Set{
    "while","end","function","local"
}


function insert(bag,element)
    bag[element] = (bag[element] or 0) +1
end

function remove(bag,element)
    local count = bag[element]
    bag[element] = (count and count >1) and count -1 or nil
end
--]]

--[[
local t = {

}
for line in io.lines() do
    t[#t +1] = line
end
t[#t+1] = ""
s = table.concat(t,"\n")
--]]

function addString(stack,s)
    stack[#stack + 1] = s
    for i = #stack-1,1,-1 do
        if #stack[i] > #stack[i+1] then
            break
        end
        stack[i] = stack[i] .. stack[i+1]
        stack[i+1] = nil
    end
end


