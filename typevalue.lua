#!/usr/bin/env lua
--# File Name: typevalue.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 六  7/ 2 00:07:25 2016
--#########################################################################
--[[page 9
print(type("Hello World!"))
print(type(10.4 * 3))
print(type(print))
print(type(type))
print(type(true))
print(type(nil))
print(type(type(type(X))))
]]

--[[page 9

print(type(a))
a = 10
print(type(a))
a = "a string"
print(type(a))
a = print
print(type(a))
]]


--[[page 12

print("one line\nnext line\n \" in quotes\",'in quotes'")
print('a backslash inside quotes: \'\\\'')
print("a simpler way:'\\'")
]]

--[[page 13

print("10"+ 1)
print("10 +1")
print("-5.3e-10" * "2")
print("hello" + 1)
]]

--[[page 13

print(10 .. 20)
a = "Hello"
print(#a)
print(#"good\0bye")
]]

--[[page 14
a = {}
k = "x"
a[k] = 10
a[20] = "great"
print(a["x"])
k = 20
print(a[k])
a["x"] = a["x"]+1
print(a["x"])
]]


--[[page 14
a = {}
a["x"] = 10
b = a
print(b["x"])
b["x"] = 20
print(a["x"])
a = nil
b = nil
]]

--[[page 15
a = {}
for i = 1,1000 do a[i] = i *2 end
print(a[9])
a["x"] = 10
print(a["x"])
print(a["y"])
]]

--[[page 15
a = {}
a.x = 15
print(a.x)
print(a.y)
]]


--[[page 15
a = {}
x = "y"
a[x] = 10
print(a[x])
print(a.x)
print(a.y)
]]

--[[page 16
a = {}
for i=1,10 do
    a[i] = io.read()
end

for i=1,#a do
    print(a[i])
end
]]

--[[page 16
a = {}
for i =1,10 do
    a[#a+1] = io.read()
end
]]

--[[page 17
a = {}
a[10000] = 1
print(table.maxn(a))
]]

--page 17
i = 10;j = "10";k= "+10"
a = {}
a[i] = "one value"
a[j] = "another value"
a[k] = "yet another value"

print(a[j])
print(a[k])
print(a[tonumber(j)])
print(a[tonumber(k)])


