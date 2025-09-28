@echo off
call "%~dp0\..\DevopsData\config.bat"

setlocal enabledelayedexpansion

set TEMPLATES_DIR=%~dp0Templates
set SCRIPTS_DIR=%~dp0..\..\Scripts\Server
set ROOT_DIR=%~dp0..\..\
set SERV_DOCKER_TMP_PATH=%TEMPLATES_DIR%\server.Dockerfile.template
set SERV_DOCKER_FILE_PATH=%ROOT_DIR%\server.Dockerfile

if not exist "%SCRIPTS_DIR%" mkdir "%SCRIPTS_DIR%"

if exist "%SERV_DOCKER_FILE_PATH%" del "%SERV_DOCKER_FILE_PATH%"

for %%F in ("%TEMPLATES_DIR%\*.template") do (
    set "filename=%%~nF"
    set "extension=%%~xF"

    if /i "!filename!" neq "server.Dockerfile" (
        copy "%%F" "%SCRIPTS_DIR%\!filename!"
    )
)


for /f "tokens=1* delims=:" %%i in ('findstr /n "^" "%SERV_DOCKER_TMP_PATH%"') do (
    set "line=%%j"
    
    if "!line!"=="" (
        echo. >> "%SERV_DOCKER_FILE_PATH%"
    ) else (
        call :ProcessLine "!line!" >> "%SERV_DOCKER_FILE_PATH%"
    )
)





echo Done!
pause
exit /b

:ProcessLine
set "line=%~1"
echo !line!
exit /b
