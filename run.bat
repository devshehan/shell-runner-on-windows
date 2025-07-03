@echo off
setlocal enabledelayedexpansion

:: Prompt for user inputs
set /p "JOB_ID=Enter Job ID: "
set /p "ENVIRONMENT=Enter Environment (e.g. d, s, l): "
set /p "TENANT=Enter Tenant (e.g., t0001, t0002): "

set "SCRIPT_DIR=%~dp0"

if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

for /f "delims=" %%i in ('wsl wslpath "%SCRIPT_DIR%"') do set "WSL_PATH=%%i"

wsl bash -c "cd \"%WSL_PATH%\" && ./main.sh !JOB_ID! !ENVIRONMENT! !TENANT!"

pause