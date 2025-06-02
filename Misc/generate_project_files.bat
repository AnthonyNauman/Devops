@echo off
call "%~dp0\..\DevopsData\config.bat"

"%VERSION_SELECTOR%" -switchversionsilent "%UPROJECT_PATH%" "%UE_PATH%"