--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2019/4/9
-- Time: 17:36
-- To change this template use File | Settings | File Templates.
--
--[[
-- 1.函数
-- 语法格式：
--function func_name (arguments-list)
-- statements-list;
--end;
-- ]]
function f(a, b) return a or b end
--Lua 函数实参和形参的匹配与赋值语句类似，多余部分被忽略，缺少部分用 nil 补足。
result = f(1)
print(result) --> 1
result = f(1,2)
print(result) --> 1
result = f(1,2,3)
print(result) --> 1

--[[
-- 2.函数的多值返回
--
-- ]]
s, e = string.find("hello Lua users", "Lua")
print(s, e) --> 7 9
--(1)定义多值返回函数
function maximum (a)
    local mi = 1 -- maximum index
    local m = a[mi] -- maximum value
    for i,val in pairs(a) do
        if val > m then
            mi = i
            m = val
        end
    end
    return m, mi
end

a= {1,3}
x,y,z = maximum(a),2
print(x,y,z) -- 3	2	nil


--[[
-- 3.可变长度函数
--语法格式：function 函数名(...) end
-- ]]
function printData(a,b,...)
    print(a,b)
    local printResult = ""
    for i,v in pairs(arg) do
        printResult = printResult .. tostring(v) .. "\t"
    end
    printResult = printResult .. "\n"
    print(printResult)
end
printData("hh","12","1")


--[[
-- 4.table的排序函数
-- ]]
network = {
    {name = "grauna", IP = "210.26.30.34"},
    {name = "arraial", IP = "210.26.30.23"},
    {name = "lua", IP = "210.26.23.12"},
    {name = "derain", IP = "210.26.23.20"},
}
table.sort(network, function (a,b)
    return (a.name > b.name)
end)
for i,v in pairs(network) do
    print(v.name)
end


--[[
-- 5.函数作为参数
 ]]
function process(a)
    a()
end

process(function()
    print("hello")
end)

--[[
--6.闭包的使用
 ]]
function test()
    local hh="hh"
    return function()
        print(hh)
    end
end
Func = test()
Func()
oldSin = math.sin
math.sin = function (x)
    return oldSin(x*math.pi/180)
end



--[[
--7.非全局函数
 ]]
Lib = {}
Lib.foo = function (x,y) return x + y end
Lib.goo = function (x,y) return x - y end
--或者
Lib = {}
function Lib.foo (x,y)
    return x + y
end
function Lib.goo (x,y)
    return x - y
end

local f = function (...)
end