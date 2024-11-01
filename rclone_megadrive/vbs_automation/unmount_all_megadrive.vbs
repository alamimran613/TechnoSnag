Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "taskkill /IM rclone.exe /F", 0, False
