@echo off
call "%~dp0\..\DevopsData\config.bat"

start "%PROJECT_NAME%-%VERSION% Client" "%CLIENT_EXE_PATH%" -WINDOWED -ResX=600 -ResY=600 -WinX=10 -WinY=50 -ExecCmds="open 127.0.0.1"
start "%PROJECT_NAME%-%VERSION% Client" "%CLIENT_EXE_PATH%" -WINDOWED -ResX=600 -ResY=600 -WinX=620 -WinY=50 -ExecCmds="open 127.0.0.1"