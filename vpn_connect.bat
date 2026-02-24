@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "PS_SCRIPT=%SCRIPT_DIR%Connect-CiscoVPN.ps1"

if not exist "%PS_SCRIPT%" (
  echo Cannot find Connect-CiscoVPN.ps1:
  echo %PS_SCRIPT%
  pause
  exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
