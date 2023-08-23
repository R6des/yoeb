@echo off
setlocal enabledelayedexpansion

rem 读取输入的编号
set /p "number=请输入编号："

rem 生成新的计算机名
set "newname=x-%number%"

rem 修改计算机名
wmic computersystem where name="%COMPUTERNAME%" call rename name="%newname%" >nul

rem 重启计算机
rem shutdown /r /t 0