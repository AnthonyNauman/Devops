@echo off
call "%~dp0\..\DevopsData\config.bat"

start "" "%JENKINS_NODE_START_BAT_FILE%"