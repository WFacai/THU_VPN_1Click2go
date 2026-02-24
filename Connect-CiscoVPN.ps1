$VpnHost = "vpn.thu.de"
$CredTarget = "CiscoVPN_THU"

function Get-VpnCliPath {
    $candidates = @(
        "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe",
        "C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe",
        "C:\Program Files (x86)\Cisco\Cisco Secure Client\vpncli.exe",
        "C:\Program Files\Cisco\Cisco Secure Client\vpncli.exe"
    )

    foreach ($path in $candidates) {
        if (Test-Path -LiteralPath $path) {
            return $path
        }
    }

    return $null
}

$vpncli = Get-VpnCliPath
if (-not $vpncli) {
    Write-Host "Cannot find vpncli.exe. Checked common Cisco AnyConnect/Secure Client paths."
    Read-Host "Press Enter to exit"
    exit 1
}

try {
    Import-Module CredentialManager -ErrorAction Stop
}
catch {
    Write-Host "CredentialManager module is not installed. Run this once first:"
    Write-Host "Install-Module CredentialManager -Scope CurrentUser"
    Read-Host "Press Enter to exit"
    exit 1
}

$cred = Get-StoredCredential -Target $CredTarget
if (-not $cred) {
    Write-Host "Credential not found in Windows Credential Manager: $CredTarget"
    Read-Host "Press Enter to exit"
    exit 1
}

$username = $cred.UserName
$password = $cred.GetNetworkCredential().Password

# Clean up stale Cisco client UI/CLI sessions that can lock connection features.
Get-Process -Name "vpnui" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Get-Process -Name "vpncli" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue

# Typical prompt order: connect -> username -> password.
# This VPN also asks to accept a banner: accept? [y/n].
# If your VPN asks for a group first, insert it before $username.
$inputLines = @(
    "connect $VpnHost"
    $username
    $password
    "y"
    "exit"
)

$tmpFile = Join-Path $env:TEMP "vpncli_input.txt"

try {
    $inputLines | Set-Content -LiteralPath $tmpFile -Encoding ASCII

    Write-Host "Connecting to VPN: $VpnHost ..."
    cmd /c "`"$vpncli`" -s < `"$tmpFile`""
}
finally {
    Remove-Item -LiteralPath $tmpFile -ErrorAction SilentlyContinue
}

Read-Host "Press Enter to exit"
