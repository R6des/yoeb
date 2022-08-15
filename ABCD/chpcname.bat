
@echo off

for /f "delims=" %%a in ('call readini.bat /s OutputVar /i nob "C:\Users\Administrator\Desktop\iot\setnb.ini"') do (
    set val=%%a
)


set name=%val%%computername:~0,12%

wmic.exe ComputerSystem Where Name="%ComputerName%" Rename Name="%name%"
