@echo off
call "%~dp0\..\DevopsData\config.bat"

start "%PROJECT_NAME%-%VERSION% Client" "%GAME_EXE_PATH%" ?listen -WINDOWED -ResX=600 -ResY=600 -WinX=1230 -WinY=50