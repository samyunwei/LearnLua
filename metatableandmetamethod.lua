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

mt.__metatable = "not your business"

s1 = Set.new{

}
print(getmetatable(s1))
setmetatable(s1,{

})

