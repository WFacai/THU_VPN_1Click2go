# Cisco VPN Ein-Klick-Skripte für Windows

[![English](https://img.shields.io/badge/Language-English-blue)](README.md)
[![中文](https://img.shields.io/badge/语言-中文-red)](README.zh-CN.md)
[![Deutsch](https://img.shields.io/badge/Sprache-Deutsch-green)](README.de.md)

[![Plattform](https://img.shields.io/badge/Plattform-Windows-0078D6)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-Erforderlich-5391FE)](#)
[![Batch](https://img.shields.io/badge/Batch-Unterstützt-4D4D4D)](#)
[![Cisco](https://img.shields.io/badge/Cisco-AnyConnect%20%2F%20Secure%20Client-1BA0D7)](#)
[![Lizenz](https://img.shields.io/badge/Lizenz-MIT-yellow.svg)](LICENSE)

Ein kompaktes Skript-Set für **Cisco AnyConnect / Cisco Secure Client** unter Windows.  
Die Anmeldung erfolgt über **PowerShell + Batch** mit der **Windows-Anmeldeinformationsverwaltung** (allgemeine Anmeldeinformationen), ohne Klartext-Passwort in den Skriptdateien.

---

## Überblick

Dieses Projekt vereinfacht die tägliche VPN-Nutzung unter Windows:

- VPN mit einem Klick verbinden
- VPN mit einem Klick trennen
- VPN-Status anzeigen
- Zugangsdaten sicher in der Windows-Anmeldeinformationsverwaltung speichern

Unterstützte Cisco-Clients (typisch):

- **Cisco AnyConnect Secure Mobility Client**
- **Cisco Secure Client**

---

## Funktionen

- ✅ Ein-Klick **Verbinden / Trennen / Status**
- ✅ Nutzung der **Windows-Anmeldeinformationsverwaltung** (allgemeine Anmeldeinformationen)
- ✅ Kein Klartext-Passwort in `.bat` / `.ps1`
- ✅ Unterstützung gängiger Cisco-Installationspfade
- ✅ Einfach mit Kommilitonen/Kollegen teilbar (jede Person speichert eigene Zugangsdaten lokal)

---

## Dateien

- `Connect-CiscoVPN.ps1` — Hauptskript (liest Zugangsdaten und verbindet)
- `vpn_connect.bat` — VPN verbinden
- `vpn_disconnect.bat` *(oder `disconnect-vpn.bat`)* — VPN trennen
- `vpn_status.bat` — VPN-Status anzeigen
- `README.md` — Englisch
- `README.zh-CN.md` — Chinesisch
- `README.de.md` — Deutsch

> Wenn deine Datei aktuell `disconnect-vpn.bat` heißt, kannst du sie so lassen.  
> Für einheitliche Benennung ist `vpn_disconnect.bat` empfohlen.

---

## Voraussetzungen

- Windows
- Cisco AnyConnect / Cisco Secure Client installiert
- PowerShell
- PowerShell-Modul `CredentialManager` (einmalige Installation)

---

## Schnellstart

### 1) Zugangsdaten speichern (wichtig)

> **Wichtig:** Bitte unter **Allgemeine Anmeldeinformationen (Generic Credentials)** speichern, nicht unter „Windows-Anmeldeinformationen“.

Pfad:

Du kannst direkt die `Win`-Taste drücken und nach **Anmeldeinformationsverwaltung** suchen (integriertes Windows-Tool).

**Anmeldeinformationsverwaltung → Allgemeine Anmeldeinformationen → Allgemeine Anmeldeinformationen hinzufügen**

Eintragen:

- **Internet- oder Netzwerkadresse**: `CiscoVPN_THU`
- **Benutzername**: dein VPN-Benutzername
- **Passwort**: dein VPN-Passwort

---

### 2) PowerShell-Modul installieren (einmalig)

PowerShell öffnen und ausführen:

```powershell
Install-Module CredentialManager -Scope CurrentUser
```

Falls eine Vertrauensabfrage erscheint, mit `Y` bestätigen.

### 3) Connect-CiscoVPN.ps1 anpassen

Prüfe, ob diese Werte zu deiner Umgebung passen:

```powershell
$VpnHost    = "vpn.thu.de"
$CredTarget = "CiscoVPN_THU"
```

- `$VpnHost`: VPN-Serveradresse
- `$CredTarget`: Exakter Name aus den allgemeinen Anmeldeinformationen

### 4) Skripte verwenden

- `vpn_connect.bat` doppelklicken → VPN verbinden
- `vpn_disconnect.bat` (oder `disconnect-vpn.bat`) doppelklicken → VPN trennen
- `vpn_status.bat` doppelklicken → Status anzeigen

---

## Sicherheitshinweise

- Passwörter werden in der Windows-Anmeldeinformationsverwaltung gespeichert
- Kein Klartext-Passwort in den Skriptdateien
- Eigene Zugangsdaten nicht weitergeben
- Jede Person sollte eigene Zugangsdaten lokal speichern

---

## Häufige Probleme

### Zugangsdaten nicht gefunden

- Prüfen, ob die Daten unter **Allgemeine Anmeldeinformationen** gespeichert wurden
- Prüfen, ob der Name exakt mit `$CredTarget` übereinstimmt (z. B. `CiscoVPN_THU`)

### Modul CredentialManager fehlt

In PowerShell ausführen:

```powershell
Install-Module CredentialManager -Scope CurrentUser
```

### Verbindung fehlgeschlagen

- Prüfen, ob `$VpnHost` korrekt ist (z. B. `vpn.thu.de`)
- Cisco-Client manuell testen
- Manche VPNs benötigen eine zusätzliche Gruppen-/Pool-Auswahl im Skript

### vpncli.exe nicht gefunden

Prüfen, ob Cisco installiert ist und `vpncli.exe` in einem dieser Pfade vorhanden ist:

- `C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\`
- `C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\`
- `C:\Program Files (x86)\Cisco\Cisco Secure Client\`
- `C:\Program Files\Cisco\Cisco Secure Client\`

---

## Anpassung für andere Hochschulen/Firmen

Für andere Umgebungen müssen in der Regel nur zwei Werte angepasst werden:

- VPN-Host (`$VpnHost`)
- Name der Anmeldeinformationen (`$CredTarget`)

Beispiel:

```powershell
$VpnHost    = "vpn.your-school.edu"
$CredTarget = "CiscoVPN_MySchool"
```

---

## Lizenz

MIT License
