#!/usr/bin/env lua
--# File Name: oop.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年09月26日 星期一 23时41分14秒
--#########################################################################

Account = {
    balance = 0,
    withdraw = function(self,v)
       self.balance =  self.balance - v
    end
}

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:new(o)
    o = o or {}
    setmetatable(o,self)
    self.__index = self
    return o
end

function Account:withdraw(v)
    if v > self.balance then error"insufficient funds" end
    self.balance = self.balance - v
end

SpecialAccount = Account:new()
s = SpecialAccount:new{
    limit = 1000.00
}
function SpecialAccount:withdraw(v)
    if v - self.balance >= self.getLimit() then
        error"insufficient funds"
    end
    self.balance = self.balance - v
end

function SpecialAccount:getLimit()
    return self.limit or 0
end

function s:getLimit()
    return self.balance * 0.10
end

local function search(k,plist)
    for i =1,#plist do
        local v = plist[i][k]
        if v then return v end
    end
end

function createClass(...)
    local c ={

    }
    local parents = {
        ...
    }

    setmetatable(c,{
        __index = function(t,k)
            local v = search(k,parents)
            t[k] = v
            --return search(k,parents)
            return v
        end
    })

    c.__index = c

    function c:new(o)
        o = o or {

        }

        setmetatable(o,c)
        return o
    end

    return c
end



Named = {

}

function Named:getname()
    return self.name
end

function Named:setname(n)
    self.name = n
end


function newAccount(initalBalance)
    local self = {
        balance = initalBalance,
        LIM = 10000.00
    }

    local withdraw = function(v)
    local extra = function()
        if self.balance > self.LIM then
            return self.balance*0.10
        else
            return 0
        end
    end
        self.balance = self.balance - v
    end

    local deposit = function(v)
        self.balance = self.balance + v
    end

    local getBalance = function() return self.balance + extra() end
    

    return {
        withdraw = withdraw,
        deposit = deposit,
        getBalance = getBalance
    }
end

function newObject(value)
    return function(action,v)
        if action == "get" then return value
        elseif action == "set" then value = v
        else error("invalid action")
        end
    end
end

--[[
Account.deposit(Account,200.00)
Account:withdraw(100.00)
print(Account.balance)


s:deposit(100.00)

a = Account:new{
    balance = 0
}
a:deposit(100.00)
print(a.balance)


NamedAccount = createClass(Account,Named)


account = NamedAccount:new{
    name = "paul"
}

print(account:getname())


acc1 =newAccount(100.00)
acc1.withdraw(40.00)
print(acc1.getBalance())
-]]


d = newObject(0)
print(d("get"))
d("set",10)
print(d("get"))
