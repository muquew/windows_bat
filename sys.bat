@echo off
chcp 65001 > nul
REM 打开环境变量


REM 检查是否以管理权限运行
NET FILE >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO 请求管理权限...
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\GetAdmin.vbs"
    ECHO UAC.ShellExecute "cmd.exe", "/k ""%~0""", "", "runas", 1 >> "%TEMP%\GetAdmin.vbs"
    "%TEMP%\GetAdmin.vbs"
    EXIT /B
)



start "" rundll32 sysdm.cpl,EditEnvironmentVariables
exit
