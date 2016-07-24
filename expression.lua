#!/usr/bin/env lua
--# File Name: expression.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 二  7/19 23:44:47 2016
--#########################################################################
print('P19')
x = math.pi
print(x - x%0.01)

function isturnback(angle)
    local tolerance = 10
    angle = angle % 360
    return (math.abs(angle - 180) < tolerance)
end
print(isturnback(-180))

print("P21")

print(4 and 5)
print(nil and 13)
print(false and 13)
print(4 or 5)
print(false or 5)

print(not nil)
print(not false)
print(not 0)
print(not not nil)

print('P22')

print('Hello' .. 'World')
print(0 .. 1)

a = "Hello"
print(a.. 'World')
print(a)

print('P23')

w = {x = 0,y=0,label = "console"}
x = {math.sin(0),math.sin(1),math.sin(2)}
w[1] = "anther filed"
x.f = w
print(w["x"])
print(w[1])
print(x.f[1])
w.x = nil


print('P24')

polyline = {
    color = "blue",thickness = 2,npoints = 4,
    {
        x = 0,y = 0
    },
    {
        x = -10,y = 0
    },
    {
        x = -10,y = 1
    },
    {
        x = 0,y = 1
    }
}

print(polyline[2].x)
print(polyline[4].y)

opnames = {
    ["+"] = "add",["-"] = "sub",["*"] = "mul",["/"] = "div"
}

i = 20;s = "-"

a = {
    [i+0] = s,[i+1] = s ..s,[i+2] = s..s..s
}

print(opnames[s])
print(a[22])


print("P28")
x = 10
local i = 1

while i <= x do
    local x = i*2
    print(x)
    i = i+1
end


if i > 20 then
    local x
    x = 20
    print(x+2)
else
    print(x)
end

print(x)

print("P29")
local a,b = 1,10
if a < b then
    print(a)
    local a
    print(a)
end
print(a,b)
