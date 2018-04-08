@echo off

rem -------------------------------------------------------------
rem  Build package for chocolatey.
rem -------------------------------------------------------------

@SetLocal EnableExtensions EnableDelayedExpansion

rem  Get package name.
cd ..\
for %%a in (".") do set CURRENT_DIR_NAME=%%~na
cd ./src

echo ===== Test (uninstall form local source) "%CURRENT_DIR_NAME%" package ====

set "PACKAGE_NANE=transgui"
set "SRC_DIR=%~dp0"
set "BUILD_DIR=..\build\%PACKAGE_NANE%"

cd %BUILD_DIR%

call choco uninstall -vy %PACKAGE_NANE% -source %CD% -version 5.15.4

if not "%1" == "1" (
    pause
)

@endlocal
