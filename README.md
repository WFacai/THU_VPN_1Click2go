# Cisco VPN One-Click for Windows (AnyConnect / Secure Client)

[![English](https://img.shields.io/badge/Language-English-blue)](README.md)
[![中文](https://img.shields.io/badge/语言-中文-red)](README.zh-CN.md)
[![Deutsch](https://img.shields.io/badge/Sprache-Deutsch-green)](README.de.md)

[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-Required-5391FE)](#)
[![Batch](https://img.shields.io/badge/Batch-Supported-4D4D4D)](#)
[![Cisco](https://img.shields.io/badge/Cisco-AnyConnect%20%2F%20Secure%20Client-1BA0D7)](#)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

One-click Cisco VPN connect/disconnect/status scripts for Windows using **PowerShell + Batch** and **Windows Credential Manager** (**no plaintext password** in script files).

---

## Overview

This project provides a small set of scripts to simplify daily VPN usage on Windows:

- Connect VPN with one click
- Disconnect VPN with one click
- Check current VPN status
- Store credentials securely in **Windows Credential Manager** (Generic Credentials)

It is designed for Cisco VPN clients such as:

- **Cisco AnyConnect Secure Mobility Client**
- **Cisco Secure Client**

---

## Features

- ✅ One-click **connect / disconnect / status**
- ✅ Uses **Windows Credential Manager** (Generic Credentials)
- ✅ No plaintext password stored in `.bat` / `.ps1`
- ✅ Supports common Cisco install paths
- ✅ Easy to share with classmates/colleagues (each user stores their own credentials)

---

## Repository Structure

- `Connect-CiscoVPN.ps1` — Main script (reads credential and connects)
- `vpn_connect.bat` — One-click connect
- `vpn_disconnect.bat` *(or `disconnect-vpn.bat`)* — Disconnect
- `vpn_status.bat` — Show VPN status
- `README.md` — English
- `README.zh-CN.md` — Chinese
- `README.de.md` — German

> If your file is currently named `disconnect-vpn.bat`, you can keep it.  
> For consistency, `vpn_disconnect.bat` is recommended.

---

## Requirements

- Windows
- Cisco AnyConnect / Cisco Secure Client installed
- PowerShell
- `CredentialManager` PowerShell module (one-time install)

---

## Quick Start

### 1) Add your VPN credential to Windows Credential Manager

> **Important:** Store it under **Generic Credentials**, not “Windows Credentials”.

Open:

**Credential Manager** → **Generic Credentials** → **Add a generic credential**

Fill in:

- **Internet or network address**: `CiscoVPN_THU`
- **User name**: your VPN username
- **Password**: your VPN password

---

### 2) Install the PowerShell module (one-time)

Open PowerShell and run:

```powershell
Install-Module CredentialManager -Scope CurrentUser
```

If prompted, type Y to trust the repository.

### 3) Edit Connect-CiscoVPN.ps1

Make sure these values match your environment:

```powershell
$VpnHost    = "vpn.thu.de"
$CredTarget = "CiscoVPN_THU"
```

- `$VpnHost`: your VPN server address
- `$CredTarget`: the exact name used in Generic Credentials

### 4) Use the scripts

- Double-click `vpn_connect.bat` → Connect VPN
- Double-click `vpn_disconnect.bat` (or `disconnect-vpn.bat`) → Disconnect VPN
- Double-click `vpn_status.bat` → Check VPN status

---

## Security Notes

- Passwords are stored in Windows Credential Manager (Generic Credentials)
- No plaintext password is stored in script files
- Do not share your own credential name, username, or password
- Each user should create their own credential entry locally

---

## Troubleshooting

### Credential not found

- Make sure the credential is stored under **Generic Credentials**
- Make sure the credential name matches `$CredTarget` exactly (e.g., `CiscoVPN_THU`)

### CredentialManager module not found

Install it in PowerShell:

```powershell
Install-Module CredentialManager -Scope CurrentUser
```

### VPN connection fails

- Verify `$VpnHost` is correct (e.g., `vpn.thu.de`)
- Test manual connection using Cisco client UI
- Some VPN setups require an extra group/pool selection line in the script input

### vpncli.exe not found

Check that Cisco is installed and `vpncli.exe` exists in one of these paths:

- `C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\`
- `C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\`
- `C:\Program Files (x86)\Cisco\Cisco Secure Client\`
- `C:\Program Files\Cisco\Cisco Secure Client\`

---

## Customization

You can adapt this project for your own school/company by changing:

- VPN host (`$VpnHost`)
- Credential target name (`$CredTarget`)
- Script filenames (optional)

Example:

```powershell
$VpnHost    = "vpn.your-school.edu"
$CredTarget = "CiscoVPN_MySchool"
```

---

## License

MIT License
