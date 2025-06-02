@echo off
call "%~dp0\..\DevopsData\config.bat"

rem build sources

@REM call "%RUNUAT_PATH%" BuildCookRun ^
@REM -project="%UPROJECT_PATH%" ^
@REM -platform=%PLATFORM% ^
@REM -clientconfig=%CONFIGURATION% ^
@REM -build -cook


rem run tests
set TEST_RUNNER="%EDITOR_PATH%" "%UPROJECT_PATH%" -ExecCmds="Automation RunTests %TEST_NAMES%;Quit" -log -abslog="%TEST_OUTPUT_LOG_PATH%" -nosplash -ReportOutputPath="%REPORT_OUTPUT_PATH%"

rem run code coverage
set REPORT_EXPORT_TYPE=html:S:\Projects\UE\Games\TPS\Build\Tests\Coverage\CodeCoverageReport
@REM set REPORT_EXPORT_TYPE=cobertura:S:\Projects\UE\Games\TPS\Build\Tests\Coverage\CodeCoverageReport.xml
"%OPEN_CPP_COVERAGE_PATH%" --modules="S:\Projects\UE\Games\TPS" --sources="S:\Projects\UE\Games\TPS\Source" ^
--excluded_sources="S:\Projects\UE\Games\TPS\Source\TPS\Tests" --export_type="%REPORT_EXPORT_TYPE%" -- %TEST_RUNNER% -v

rem clean coverage log artifacts
del /q LastCoverageResults.log

rem copy test artifacts
set TEST_DIR=%~dp0
set TEST_DATA_DIR=%~dp0Data
robocopy "%TEST_DATA_DIR%" "%REPORT_OUTPUT_PATH%" /E

rem start local server and show report
set PORT=8081
set HTTP_SERVER_PATH=http://localhost:%PORT%

pushd "%REPORT_OUTPUT_PATH%"
start "" "%HTTP_SERVER_PATH%"
start "" "%HTTP_SERVER_PATH%\Coverage\CodeCoverageReport\index.html"
call http-server -p="%PORT%"
popd