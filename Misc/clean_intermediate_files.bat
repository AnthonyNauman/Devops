@echo off
call "%~dp0\..\DevopsData\config.bat"

pushd "%PROJECT_DIR%"
FOR %%f in (%DIRS_TO_REMOVE%) do (
    rmdir /s /q %%f
)

FOR %%f in (%FILES_TO_REMOVE%) do (
    del /q %%f
)
popd