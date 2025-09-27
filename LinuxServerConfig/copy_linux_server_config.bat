@echo off
setlocal enabledelayedexpansion

set TEMPLATES_DIR=%~dp0Templates
set SCRIPTS_DIR=%~dp0..\..\Scripts
set ROOT_DIR=%~dp0..\..\

if not exist "%SCRIPTS_DIR%" mkdir "%SCRIPTS_DIR%"

for %%F in ("%TEMPLATES_DIR%\*.template") do (
    set "filename=%%~nF"
    set "extension=%%~xF"

    if /i "!filename!"=="server.Dockerfile" (
        copy %%F %ROOT_DIR%\!filename!
    ) else {
        copy %%F %SCRIPTS_DIR%\!filename!
    }
)
