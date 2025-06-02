@echo off

if exist del /q %TARGET_FILE_PATH%

for /f "usebackq tokens=*" %%a in ("%TARGET_TEMPLATE_PATH%") do (
     if %%a == NEW_LINE (
        echo.>>"%TARGET_FILE_PATH%"
    ) else (
        call echo %%a>>"%TARGET_FILE_PATH%"
    )
)

call "%~dp0\..\Misc\format_all_files.bat"