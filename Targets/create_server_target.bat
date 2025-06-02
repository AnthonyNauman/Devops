@echo off
call "%~dp0\..\DevopsData\config.bat"

set TARGET_TYPE=Server
set MODULE_NAME=%PROJECT_NAME%
set TARGET_FILE_NAME=%MODULE_NAME%%TARGET_TYPE%.Target.cs
set TARGET_FILE_PATH=%SOURCE_CODE_PATH%\%TARGET_FILE_NAME%

call "%~dp0create_target.bat"