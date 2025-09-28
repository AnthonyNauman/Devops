@echo off
call "%~dp0\..\DevopsData\config.bat"

set PORT=7778
set SERVER_LOGS_PATH=%PROJECT_DIR%\Saved\Logs\LinuxServer\%PORT%

if not exist "%SERVER_LOGS_PATH%" mkdir "%SERVER_LOGS_PATH%"

docker run -v %SERVER_LOGS_PATH%:/app/%PROJECT_NAME%/Saved/Logs -p %PORT%:7777/udp --rm -it game-server:%VERSION%

pause