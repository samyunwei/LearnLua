#!/usr/bin/env lua
--# File Name: metatableandmetamethod.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年09月11日 星期日 21时00分06秒
--#########################################################################
--[[
t = {
}
t1 = {

}
setmetatable(t,t1)
--print(getmetatable(t))
assert(getmetatable(t) == t1)
--]]
--[[
print(getmetatable("hi"))
print(getmetatable(10))
--]]

Set = {
}

local mt = {

}

function Set.new(l)
    local set = {

    }
    setmetatable(set,mt)
    for _,v in ipairs(l) do set[v] = true end
    return set
end

function Set.union(a,b)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attempt to 'add' a set with a non-set value",2)
    end

    local res = Set.new{

    }
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end


function Set.intersection(a,b)
    local res = Set.new{

    }
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.toString(set)
    local l = {

    }

    for e in pairs(set) do
        l[#l + 1] = e
    end
    return  "{" .. table.concat(l,",") .."}"
end

function Set.print(s)
    print(Set.toString(s))
end

function Set.le(a,b)
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

function Set.lt(a,b)
    return Set.le(a,b) and not Set.le(b,a)
end

function Set.eq(a,b)
    return Set.le(a,b) and Set.le(b,a)
end

--[[
s1 = Set.new{
    10,20,30,50
}

s2 = Set.new{
    30,1
}

print(getmetatable(s1))
print(getmetatable(s2))

--]]
mt.__add = Set.union

--s3 = s1 + s2
--Set.print(s3)

mt.__mul = Set.intersection
--Set.print((s1 + s2) * s1)



mt.__le = Set.le
mt.__lt = Set.lt
mt.__eq = Set.eq
--[[
s1 = Set.new{
    2,4
}
s2 = Set.new{
    4,10,2
}
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
print(s1 == s2 *s1)
--]]
--[[
print({

})
mt.__tostring = Set.toString

s1 = Set.new{
    10,4,5
}
print(s1)

--]]
--[[
mt.__metatable = "not your business"

s1 = Set.new{

}
print(getmetatable(s1))
setmetatable(s1,{

})
--]]
--[[
Window = {
}

Window.prototype = {
    x = 0,y = 0,width = 100,height = 100
}
Window.mt = {

}


function Window.new(o)
    setmetatable(o,Window.mt)
    return o
end
--
--Window.mt.__index = function(table,key)
--  return Window.prototype[key]
--end
Window.mt.__index = Window.prototype
w = Window.new{
    x = 10,y = 20
}

print(w.width)

--]]
--[[
function setDefault(t,d)
    local mt = {
        __index = function() return d end
    }
    setmetatable(t,mt)
end

tab = {
    x = 10,y = 20
}

print(tab.x,tab.z)
setDefault(tab,0)
print(tab.x,tab.z)

--]]
--[[
local mt = {
    __index = function(t) return t.___ end
}

function setDefault(t,d)
    t.___ = d
    setmetatable(t,mt)
end
--]]

--[[
local key = {
}
local mt = {
    __index = function(t) return t[key] end
}

function setDefault(t,d)
    t[key] = d
    setmetatable(t,mt)
end

--]]

--[[
t = {
}

local _t = t
t = {
}

local mt = {
    __index = function(t,k)
        print("* access to element".. tostring(k))
        return _t[k]
    end,
    __newindex = function(t,k,v)
        print("update of element " .. tostring(k) .. " to " .. tostring(v))
        _t[k] = v
    end
}
setmetatable(t,mt)

t[2] = "hello"
print(t[2])
--]]

--[[
local index = {

}

local mt = {
    __index = function(t,k)
        print("* access to element".. tostring(k))
        return t[index][k]
    end,
    __newindex = function(t,k,v)
        print("update of element " .. tostring(k) .. " to " .. tostring(v))
        t[index][k] = v
    end
}

function track(t)
    local proxy = {
    }
    proxy[index] = t
    setmetatable(proxy,mt)
    return proxy
end

t = {

}
t = track(t)
t[2] = "hello"
print(t[2])
--]]

function readOnly(t)
    local proxy = {

    }
    local mt = {
        __index = t,
        __newindex = function(t,k,v)
            error("attempt to update a readOnly table",2)
        end
    }
    setmetatable(proxy,mt)
    return proxy
end

days = readOnly{
    "Sunday","Monday","Tusday","Wednesday","Thursday","Friday","Saturday"
}

print(days[1])
days[2] = "Noday"

    
