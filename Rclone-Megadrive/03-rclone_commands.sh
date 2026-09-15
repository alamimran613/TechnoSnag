# rclone Configuration
rclone config

# rclone Mount Cloud Storage to PC Drive
rclone mount megadrive1: D: --vfs-cache-mode writes --poll-interval 5s

# Terminate rclone Process Forcefully
taskkill /IM rclone.exe /F

