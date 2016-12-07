#!/usr/bin/env lua
--# File Name: testxml.lua
--# Author: Sam
--# mail: samyunwei@163.com
--# Created Time: 2016年12月07日 星期三 21时02分46秒
--#########################################################################
print("start")
a = require "lxp"
print "end require"
print(a)
local count = 0
callbacks = {
    StartElement = function(parser,tagname)
        io.write("+ ",string.rep(" ",count),tagname,"\n")
        count = count +1
    end,
    EndElement = function(parser,tagname)
        count = count -1
        io.write("- ",string.rep(" ",count),tagname,"\n")
    end
    ,
}
print "beigin"
teststr = "<to><yes/></to>"
p = a.new(callbacks)
print "runing"
p:parse(teststr)

assert(p:parse())
p:close()
