@echo off
call "%~dp0\..\DevopsData\config.bat"

"%RUNUAT_PATH%" BuildCookRun ^
-project="%UPROJECT_PATH%" ^
-platform=%PLATFORM% ^
-serverconfig=%CONFIGURATION% ^
-build -cook -skippackage -server -noclient