@echo off
call "%~dp0\..\DevopsData\config.bat"

FOR /R "%SOURCE_CODE_PATH%" %%f IN (*.cpp, *.h, *.hpp, *.cs) DO (
    clang-format -i "%%f"
    echo "Formatting %%f"
)
PAUSE