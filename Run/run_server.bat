@echo off
call "%~dp0\..\DevopsData\config.bat"

start "%PROJECT_NAME%-%VERSION% Server" "%SERVER_EXE_PATH%" -log