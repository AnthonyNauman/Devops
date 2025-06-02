@echo off
call "%~dp0\..\DevopsData\config.bat"

"%RUNUAT_PATH%" BuildCookRun ^
-project="%UPROJECT_PATH%" ^
-platform=%PLATFORM% ^
-clientconfig=%CONFIGURATION% ^
-archivedirectory=%ARCHIVE_DIR% ^
-build -cook -skippackage -stage -archive -pak -allmaps