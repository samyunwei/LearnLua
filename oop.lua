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
--[[
Account.deposit(Account,200.00)
Account:withdraw(100.00)
print(Account.balance)
--]]

a = Account:new{
    balance = 0
}
a:deposit(100.00)
print(a.balance)
