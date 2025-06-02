@echo off
setlocal enabledelayedexpansion

set SOURCE_DIR=%~dp0Templates
set DEST_DIR=%~dp0..\DevopsData
set SCRIPTS_DIR=%DEST_DIR%\..\..\Scripts

if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"
if not exist "%SCRIPTS_DIR%" mkdir "%SCRIPTS_DIR%"

for %%F in ("%SOURCE_DIR%\*.template") do (
    set "filename=%%~nF"
    set "extension=%%~xF"
    if /i "!filename!"=="config.bat" (
        copy %%F %DEST_DIR%\!filename!
    ) else if /i "!filename!"==".gitignore" (
        copy %%F %SCRIPTS_DIR%\..\!filename!
    ) else if /i "!filename!"=="jenkins.properties" (
        copy %%F %DEST_DIR%\!filename!
    ) else if /i "!filename!"==".clang-format" (
        copy %%F %SCRIPTS_DIR%\..\!filename!
    ) else (
        copy %%F %SCRIPTS_DIR%\!filename!
    )
)