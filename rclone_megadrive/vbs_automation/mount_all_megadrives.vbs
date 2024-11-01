Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "rclone mount megadrive1: M: --vfs-cache-mode writes", 0, False
WshShell.Run "rclone mount megadrive2: N: --vfs-cache-mode writes", 0, False
WshShell.Run "rclone mount megadrive3: O: --vfs-cache-mode writes", 0, False
