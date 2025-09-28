@echo off
setlocal enabledelayedexpansion

echo.
echo ########################################
echo #####     Docker Build Script      #####
echo ########################################
echo.

call "%~dp0\..\DevopsData\config.bat"

set DOCKERFILE_PATH=%PROJECT_DIR%\server.Dockerfile
set SERV_ARTIFACTS_LOCAL_PATH=./Artifacts/LinuxServer
set ENTRY_FILE_NAME=%PROJECT_NAME%Server.sh
set IMAGE_NAME=game-server
set TAG=%VERSION%

if not exist "%DOCKERFILE_PATH%" (
    echo ERROR: Dockerfile not found!
    echo Expected at: %DOCKERFILE_PATH%
    pause
    exit /b 1
)

docker build -f %DOCKERFILE_PATH% ^
    -t %IMAGE_NAME%:%TAG% %PROJECT_DIR%


if !errorlevel! equ 0 (
    echo.
    echo ########################################
    echo ###   End Docker Build Successfully  ###
    echo ########################################
    echo.
) else (
    echo.
    echo ########################################
    echo ###   End Docker Build Failed!       ###
    echo ########################################
    echo.
)

pause