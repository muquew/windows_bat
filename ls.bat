@echo off
chcp 65001 > nul
REM 文件名长度：filenameLength，注释显示第三行
set "filenameLength=30"

REM Enable delayed expansion
setlocal enabledelayedexpansion

rem 添加 filenameLength 个空格
set "spaces="
for /L %%i in (1,1,%filenameLength%) do (
    set "spaces=!spaces! "
)

REM 设置目标文件夹路径
set "folder_path=D:\Share\i\axdx\mybat"

REM 遍历文件夹下的所有.bat文件
for %%F in ("%folder_path%\*.bat") do (

    rem 文件名（添加后缀%%~nxF）
    set "filename=%%~nF"

    rem 添加filenameLength个空格
    set "filename=!filename!!spaces!"

    rem 剪切到filenameLength个字符
    set "filename=!filename:~0,%filenameLength%!"

    rem 输出文件名不换行
    echo|set /p="!filename!"
    
    REM 读取文件内容的第三行，通过设置skip=2（跳过文件或输出的前两行）
    set "secondLineProcessed="
    for /F "usebackq tokens=* skip=2" %%A in ("%%F") do (
        if not defined secondLineProcessed (
            set "line=%%A"
            rem 去除前四个字符”REM “
            echo !line:~4!
            set "secondLineProcessed=true"
        )
    )
)

rem 结尾输出空行
echo.