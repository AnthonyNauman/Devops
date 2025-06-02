@echo off
call "%~dp0\..\DevopsData\config.bat"

"%RUNUAT_PATH%" BuildCookRun ^
-project="%UPROJECT_PATH%" ^
-platform=%PLATFORM% ^
-clientconfig=%CONFIGURATION% ^
-build -cook -skippackage -client