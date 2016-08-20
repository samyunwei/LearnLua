#!/usr/bin/env lua
--# File Name: deepfunction.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 三  8/17 23:10:04 2016
--#########################################################################
--[[
a = {
    p = print
}

a.p("Hello World")
print = math.sin
a.p(print(1))
sin = a.p
sin(10,20)
--]]

--[[
function derivative(f,delta)
    delta = delta or 1e-4
    return function(x)
            return (f(x+delta) - f(x)) /delta
        end
end

c = derivative(math.sin)
print(math.cos(10),c(10))
--]]

--[[
names = {
    "Peter","Paul","Mary"
}
grades = {
    Mary = 10,Paul = 7,Peter = 8
}
--[[
table.sort(names,function (n1,n2) 
    return grades[n1] > grades[n2]
end) 

function sortbygrade(names,grades)
    table.sort(names,function (n1,n2)
        return grades[n1] > grades[n2]
    end)
end

sortbygrade(names,grades)

for i,v in ipairs(names) do
        print(v)
    end

--]]

--[[
function newCounter()
    local i = 0
    return function ()
        i = i+1
        return i
    end
end

c1 = newCounter()
print(c1())
print(c1())
print(c1())

c2 = newCounter()
print(c2())
print(c2())
print(c2())

--]]

--[[

do
    local oldsin = math.sin
    local k = math.pi /180
    math.sin = function(x)
        return oldsin(x*k)
    end
end

print(math.sin(30))


--]]
--[[
Lib = {
    foo = function(x,y) return x+y end,
    goo = function(x,y) return x-y end
}

Lib2 = {
}

function Lib2.foo (x,y) return x+y end
function Lib2.goo(x,y) return x-y end


local fact
fact = function(n)
    if n== 0 then return 1
    else return n * fact(n-1)
    end
end

local function fact(n)
    if n== 0 then return 1
    else return n * fact(n-1)
    end
end
print(fact(5))

--]]

function room1()
    local move = io.read()
    if move == "south" then return room3()
        elseif move == "east" then return room2()
            else
                print("incalid move")
                return room1()
            end
end

function room2()
    local move = io.read()
    if move == "south" then return room4()
        elseif move == "west" then return room1()
            else
                print("invalid move")
                return room2()
            end
end


function room3()
    local move = io.read()
    if move == "north" then return room1()
        elseif move == "eash" then return room4()
            else
                print("invalid move")
                return room3()
            end
end


function room4()
    print("congratulations!")
end


room1()
