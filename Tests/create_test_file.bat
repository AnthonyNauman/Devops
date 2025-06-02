@echo off
call "%~dp0\..\DevopsData\config.bat"

:begin
set /p TestClassName= "Enter test class name: "
if [%TestClassName%]==[] goto:begin
set /p TestRelativePath= "Enter relative to [Source\%PROJECT_NAME%] directory (use \ symbol for subdirs): "

rem .h / .cpp file names
set TestCppFileName=%TestClassName%.cpp
set TestHFileName=%TestClassName%.h

rem full paths to .h / .cpp files to create
set TestAbsoluteDir=%SOURCE_CODE_PATH%\%PROJECT_NAME%\%TestRelativePath%
if [%TestRelativePath%]==[] set TestAbsoluteDir=%SOURCE_CODE_PATH%\%PROJECT_NAME%
set TestCppFilePath=%TestAbsoluteDir%\%TestCppFileName%
set TestHFilePath=%TestAbsoluteDir%\%TestHFileName%

rem Confirmation
echo.
echo =========== Files to be created: ===========
echo %TestCppFilePath%
echo %TestHFilePath%
echo ============================================
echo.
set /p UserConfirmed= "Confirm? [Y/N or (E)xit]: " 
if %UserConfirmed% == N goto:begin
if %UserConfirmed% == n goto:begin
if %UserConfirmed% == E goto:EOF
if %UserConfirmed% == e goto:EOF

rem create dir
if not exist "%TestAbsoluteDir%" mkdir "%TestAbsoluteDir%"

rem full paths .h / .cpp template files
set TestCppTemplateFilePath=%PROJECT_DIR%\Devops\Tests\Templates\Test.cpp.template
set TestHTemplateFilePath=%PROJECT_DIR%\Devops\Tests\Templates\Test.h.template

rem template file vars
rem path with \
set TempPath=%TestRelativePath%\%TestClassName%.h
rem replace \ with / for include string
set TEST_INCLUDE_FILE="%TempPath:\=/%"
set "OR=^|"
set "AND=^&"

rem remove old files if exist
if exist "%TestCppFilePath%" del /q "%TestCppFilePath%"
if exist "%TestHFilePath%" del /q "%TestHFilePath%"

rem create actual files
call :createTemplate "%TestHTemplateFilePath%" , "%TestHFilePath%"
call :createTemplate "%TestCppTemplateFilePath%" , "%TestCppFilePath%"

@REM rem clang-format
call "%~dp0..\Misc\format_all_files.bat"
goto:EOF

rem function to create .h / .cpp from template
:createTemplate
set TemplateName=%~1
set FileToWriteIn=%~2
for /f "usebackq tokens=*" %%a in ("%TemplateName%") do (
    if %%a == NEW_LINE (
        echo.>>"%FileToWriteIn%"
    ) else (
        call echo %%a>>"%FileToWriteIn%"
    )
)