@echo off
chcp 65001 > nul
REM 运行或关闭MySQL服务


REM 检查是否以管理权限运行
NET FILE >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO 请求管理权限...
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\GetAdmin.vbs"
    ECHO UAC.ShellExecute "cmd.exe", "/k ""%~0""", "", "runas", 1 >> "%TEMP%\GetAdmin.vbs"
    "%TEMP%\GetAdmin.vbs"
    EXIT /B
)

set "mysqlStatus="

sc query MySQL | findstr /C:"RUNNING" >nul
if %errorlevel% equ 0 (
  set "mysqlStatus=running"
  echo MySQL服务已经启动
  echo.
  echo 请按下 Enter 键关闭MySQL服务，或按下空格键退出脚本...

) else (
  set "mysqlStatus=stopped"
  echo MySQL服务未启动
  echo.
  echo 请按下 Enter 键启动MySQL服务，或按下空格键退出脚本...

)

:LOOP
python -c "import msvcrt; x = msvcrt.getch(); exit(13 if x == b'\r' else 32 if x == b' ' else 0)"
if %errorlevel% equ 13 (
    if "%mysqlStatus%"=="running" (
        echo 执行MySQL服务关闭操作
	      net stop MySQL
    ) else if "%mysqlStatus%"=="stopped" (
        echo 执行MySQL服务启动操作
      	net start MySQL
    )
) else if %errorlevel% equ 32 (
    exit /b
) else (
    echo 无效的按键,请继续键入
    goto LOOP
)
