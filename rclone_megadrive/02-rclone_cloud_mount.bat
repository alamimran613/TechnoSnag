@echo off
start "megadrive1" rclone mount megadrive1: M: --vfs-cache-mode writes
start "megadrive2" rclone mount megadrive2: N: --vfs-cache-mode writes
start "megadrive3" rclone mount megadrive3: O: --vfs-cache-mode writes
