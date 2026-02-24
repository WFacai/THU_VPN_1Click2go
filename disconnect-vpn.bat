@echo off
setlocal

set "VPNCLI="
for %%P in (
  "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
  "C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
  "C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe"
  "C:\Program Files\Cisco\Cisco Secure Client\vpncli.exe"
) do (
  if not defined VPNCLI if exist "%%~P" set "VPNCLI=%%~P"
)

if not defined VPNCLI (
    echo Cannot find vpncli.exe. Checked common Cisco AnyConnect/Secure Client paths.
    pause
    exit /b 1
)

"%VPNCLI%" disconnect
pause
