@echo off
chcp 65001 > nul
REM 文件批量命名(相同格式(ctrl+A，F2命名))

mode con cols=40 lines=20 & color 0f
echo 提示：
echo 本批处理可批量替换所有文件名中的相同字符
echo ----------------------------------------
echo.&set /p strtemp3= 请输入替换的文件类型：
echo.&set /p strtemp1= 请输入要替换的字符串：
echo.&set /p strtemp2= 请输入替换后的字符串：
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a /b *.%strtemp3%') do (
set nobird=%%a
ren "%%~a" "!nobird:%strtemp1%=%strtemp2%!")
echo. Done！
pause