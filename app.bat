@echo off
chcp 65001 > nul
REM 控制面板-程序与功能
start "" control.exe /name Microsoft.ProgramsAndFeatures
exit