# THU Cisco VPN 一键连接脚本（Windows）

[![English](https://img.shields.io/badge/Language-English-blue)](README.md)
[![中文](https://img.shields.io/badge/语言-中文-red)](README.zh-CN.md)
[![Deutsch](https://img.shields.io/badge/Sprache-Deutsch-green)](README.de.md)

[![平台](https://img.shields.io/badge/平台-Windows-0078D6)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-需要-5391FE)](#)
[![批处理](https://img.shields.io/badge/批处理-BAT支持-4D4D4D)](#)
[![Cisco](https://img.shields.io/badge/Cisco-AnyConnect%20%2F%20Secure%20Client-1BA0D7)](#)
[![许可证](https://img.shields.io/badge/许可证-MIT-yellow.svg)](LICENSE)

适用于已安装 **Cisco AnyConnect / Cisco Secure Client** 的 Windows 电脑。  
脚本通过 **PowerShell + BAT** 配合 **Windows 凭据管理器（普通凭据）** 实现一键连接 / 断开 / 查看状态，且**不在脚本中保存明文密码**。

---

## 项目简介

本项目用于简化 Windows 下的 Cisco VPN 日常使用：

- 一键连接 VPN
- 一键断开 VPN
- 查看当前 VPN 状态
- 账号密码存放在 **Windows 凭据管理器（普通凭据）**

支持以下客户端（常见）：

- **Cisco AnyConnect Secure Mobility Client**
- **Cisco Secure Client**

---

## 功能特点

- ✅ 一键连接 / 断开 / 查看状态
- ✅ 使用 **Windows 凭据管理器（普通凭据）**
- ✅ `.bat` / `.ps1` 文件中不保存明文密码
- ✅ 兼容常见 Cisco 安装路径
- ✅ 方便分享给同学/同事（每人本地保存自己的凭据）

---

## 文件结构

- `Connect-CiscoVPN.ps1` —— 主脚本（读取凭据并连接）
- `vpn_connect.bat` —— 一键连接
- `vpn_disconnect.bat`（或 `disconnect-vpn.bat`）—— 断开 VPN
- `vpn_status.bat` —— 查看状态
- `README.md` —— 英文说明
- `README.zh-CN.md` —— 中文说明
- `README.de.md` —— 德语说明

> 如果你当前文件名是 `disconnect-vpn.bat`，可以继续使用。  
> 如果想统一风格，建议改成 `vpn_disconnect.bat`。

---

## 使用前准备

- Windows 系统
- 已安装 Cisco AnyConnect / Cisco Secure Client
- PowerShell
- `CredentialManager` 模块（只需安装一次）

---

## 快速开始

### 1）添加凭据（必须）

> **重要：请添加到「普通凭据（Generic Credentials）」**，不要放在“Windows 凭据”。

打开路径：

**凭据管理器 → 普通凭据 → 添加普通凭据**

填写：

- **Internet 或网络地址**：`CiscoVPN_THU`
- **用户名**：你的 VPN 用户名
- **密码**：你的 VPN 密码

---

### 2）安装 PowerShell 模块（只需一次）

打开 PowerShell，执行：

```powershell
Install-Module CredentialManager -Scope CurrentUser
```

如果提示是否信任仓库，输入 `Y`。

### 3）修改 Connect-CiscoVPN.ps1 配置

确认以下参数与你的实际环境一致：

```powershell
$VpnHost    = "vpn.thu.de"
$CredTarget = "CiscoVPN_THU"
```

- `$VpnHost`：VPN 服务器地址
- `$CredTarget`：凭据管理器中保存的名称（必须完全一致）

### 4）使用脚本

- 双击 `vpn_connect.bat` → 连接 VPN
- 双击 `vpn_disconnect.bat`（或 `disconnect-vpn.bat`）→ 断开 VPN
- 双击 `vpn_status.bat` → 查看当前状态

---

## 安全说明

- 密码存放在 Windows 凭据管理器（普通凭据）中
- 脚本文件中不保存明文密码
- 不要把自己的凭据名称、用户名、密码发给他人
- 每个人都应在自己电脑上单独添加凭据

---

## 常见问题

### 1）提示“未找到凭据”

请检查：

- 是否添加到了**普通凭据**
- 凭据名称是否与 `$CredTarget` 完全一致（如 `CiscoVPN_THU`）

### 2）提示未安装 CredentialManager 模块

在 PowerShell 中执行：

```powershell
Install-Module CredentialManager -Scope CurrentUser
```

### 3）连接失败

请检查：

- `$VpnHost` 是否正确（如 `vpn.thu.de`）
- Cisco 客户端能否手动正常连接
- 某些 VPN 会要求额外的组/池（group/pool）选择编号，需要在脚本里增加一行输入

### 4）提示找不到 vpncli.exe

请确认已安装 Cisco 客户端，并检查以下路径之一是否存在：

- `C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\`
- `C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\`
- `C:\Program Files (x86)\Cisco\Cisco Secure Client\`
- `C:\Program Files\Cisco\Cisco Secure Client\`

---

## 自定义配置（给其他学校/公司）

如果你要给其他学校或公司使用，只需要改两项：

- VPN 地址（`$VpnHost`）
- 凭据名称（`$CredTarget`）

示例：

```powershell
$VpnHost    = "vpn.your-school.edu"
$CredTarget = "CiscoVPN_MySchool"
```

---

## 许可证

MIT License
