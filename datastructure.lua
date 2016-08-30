#!/usr/bin/env lua
--# File Name: datastructure.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 二  8/30 23:53:26 2016
--#########################################################################
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

