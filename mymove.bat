@echo off
chcp 65001 > nul
REM 移动桌面文件到D:\desktop

set "desktopPath=%USERPROFILE%\Desktop"
set "destinationPath=D:\desktop"

rem 检查目标文件夹是否存在，如果不存在则创建
if not exist "%destinationPath%" mkdir "%destinationPath%"

for /F "delims=" %%F in ('dir "%desktopPath%" /A:-D /B') do (
    rem 移动文件
    move "%desktopPath%\%%F" "%destinationPath%"
)

for /F "delims=" %%D in ('dir "%desktopPath%" /A:D /B') do (
    rem 移动文件夹
    xcopy "%desktopPath%\%%D" "%destinationPath%\%%D" /E /I
    rd /S /Q "%desktopPath%\%%D" >nul
)

echo 移动完成！
