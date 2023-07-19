@echo off

REM 重启GeekDesk

REM 终止 GeekDesk.exe 进程（如果存在）
taskkill /f /im GeekDesk.exe > nul 2>&1

REM 启动 GeekDesk.exe 进程
start "" /d "D:\GeekDesk 2.5.13\" GeekDesk.exe

exit
