#!/usr/bin/env lua
--# File Name: function.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年07月25日 星期一 13时13分01秒
--#########################################################################
print "P35"

print "Hello world!"
--dofile('a.lua')
print [[a muilt-line
    message]]

function f(a,b) return a or b end


print(f(3))
print(f(3,4))

s,e = string.find("Hello Lua users","Lua")
print (s,e)


print "P37"

function maximun(a)
    local mi = 1
    local m = a[mi]
    for i,val in pairs(a) do
        if val > m then
            mi = i
            m = val
        end
    end
    return m,mi
end


print(maximun{
    8,10,23,12,5
})


function foo0() end
function foo1() return "a" end
function foo2() return "a","b" end


x,y = foo2()
print (x,y)
x = foo2()
print (x)
x,y,z = 10,foo2()
print(x,y,z)


x,y = foo0()
print(x,y)
x,y = foo1()
print(x,y)
x,y,z = foo2()
print(x,y,z)


x,y = foo2(),20
print(x,y)

x,y = foo0(),20,30
print(x,y)

print"P38"

print(foo0())
print(foo1())
print(foo2())
print(foo2(),1)
print(foo2().."x")

function showtable(a)
    for i,v in pairs(a) do
        print(i,v)
    end
end
t = {
    foo0()
}
showtable(t)

t = {
    foo1()
}

showtable(t)

t = {
    foo2()
}

showtable(t)


t = {
    foo0(),foo2(),4
}
print "11"
print(t[1])
showtable(t)

function foo(i)
    if i == 0 then return foo0()
    elseif i == 1 then return foo1()
    elseif i == 2 then return foo2()
    end
end

print "foo"
print(foo(1))
print(foo(2))
print(foo(0))
print(foo(3))

print((foo(1)))
print((foo(2)))
print((foo(0)))
