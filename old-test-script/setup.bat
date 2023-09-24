@ECHO OFF
@REM color c
title Batch Script for installing powershell modules

@REM Powershell.exe -executionpolicy remotesigned -File setup.ps1

goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        Powershell -executionpolicy remotesigned -command "& '%~dpn0.ps1'"
    ) else (
        echo Failure: Current permissions inadequate.
    )
    
    pause >nul

@REM Powershell -executionpolicy remotesigned -command "& '%~dpn0.ps1'"

@REM Powershell -NoProfile -command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"

PAUSE
