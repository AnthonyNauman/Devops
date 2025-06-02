@echo off
call "%~dp0\..\DevopsData\config.bat"

rem remove prev data folder
set TEST_DIR=%~dp0
set TEST_DATA_DIR=%~dp0Data
rmdir /s /q "%TEST_DATA_DIR%"

rem copy automation content
robocopy "%UE_AUTOMATION_CONTENT_PATH%" "%TEST_DATA_DIR%" /E

rem install bower (need nodejs)
call npm install -g bower

rem install bower packages
pushd "%TEST_DIR%"
cd "%TEST_DATA_DIR%"
call bower install "%TEST_DATA_DIR%\bower.json"
popd

rem install simple local http server
call npm install http-server bower -g