# 🏪 Microsoft Store --- Remove, Check & Restore

> **Purpose:** This document explains how to remove Microsoft Store
> using PowerShell, check whether the Store package is available, and
> restore/re-register it when the package is still present.

> ⚠️ **Run PowerShell as Administrator.**

------------------------------------------------------------------------

## 🗑️ 1. Remove Microsoft Store

Open **PowerShell as Administrator** and run:

``` powershell
Get-AppxPackage -AllUsers *Microsoft.WindowsStore* | Remove-AppxPackage
```

### Result

``` text
Microsoft Store
       ↓
     ❌ Removed
```

After running the command, the Microsoft Store application will be
removed from the system/user installations affected by the command.

> ⚠️ Removing Microsoft Store is not a Microsoft-supported permanent
> configuration. Use this method for testing/troubleshooting purposes.

------------------------------------------------------------------------

## 🔍 2. Check Microsoft Store Package

To check whether the Microsoft Store package is still available, run:

``` powershell
Get-AppxPackage -AllUsers Microsoft.WindowsStore
```

### If output is returned

If package information is displayed, the Microsoft Store package is
still available on the system.

### If there is no output

``` text
No output
```

The Microsoft Store package was not found by the current package query.

------------------------------------------------------------------------

## 🔄 3. Restore / Re-register Microsoft Store

If the Microsoft Store package is still available, open **PowerShell as
Administrator** and run:

``` powershell
Get-AppxPackage -AllUsers Microsoft.WindowsStore | ForEach-Object {
    Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"
}
```

This re-registers the available Microsoft Store package using its
`AppXManifest.xml`.

### After running the command

1.  🔄 Restart the PC.
2.  🏪 Open the Start Menu.
3.  Search for **Microsoft Store**.
4.  Open it and verify that it is working.

------------------------------------------------------------------------

## 📌 Quick Reference

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Action                              Command
  ----------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
  🗑️ Remove Store                     `Get-AppxPackage -AllUsers *Microsoft.WindowsStore* \| Remove-AppxPackage`

  🔍 Check Store                      `Get-AppxPackage -AllUsers Microsoft.WindowsStore`

  🔄 Restore / Re-register            `Get-AppxPackage -AllUsers Microsoft.WindowsStore \| ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" }`
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------

## ⚠️ Important Notes

-   Always run PowerShell **as Administrator**.
-   Keep a recovery option or system backup available before removing
    system applications.
-   If Step 2 returns **no output**, Step 3 will not restore the Store
    because there is no existing package installation location to
    register.
-   Removing Microsoft Store is not an officially supported permanent
    configuration.

------------------------------------------------------------------------

## 🔗 Microsoft Documentation

-   Microsoft Store troubleshooting:
    https://learn.microsoft.com/en-us/troubleshoot/windows-client/shell-experience/modern-inbox-store-apps-troubleshooting-guidance
-   `Get-AppxPackage`:
    https://learn.microsoft.com/en-us/powershell/module/appx/get-appxpackage
-   `Remove-AppxPackage`:
    https://learn.microsoft.com/en-us/powershell/module/appx/remove-appxpackage
-   `Add-AppxPackage`:
    https://learn.microsoft.com/en-us/powershell/module/appx/add-appxpackage
