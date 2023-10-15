
chcp 65001 > nul
REM 关闭键盘
@cd/d"%~dp0"&(cacls "%SystemDrive%\System Volume Information" >nul 2>nul)||(start "" mshta vbscript:CreateObject^("Shell.Application"^).ShellExecute^("%~nx0"," %*","","runas",1^)^(window.close^)&exit /b)
sc config i8042prt start= disabled
shutdown -r -t 0
