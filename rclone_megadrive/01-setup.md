

# rclone Installation and Configuration Guide

### 1. Download rclone from below link
**Info:** This is **not an installer.** This will be run using cmd. So, **Do not install.**  
```bash
https://rclone.org/downloads/
```
### 2. Download and Install WinFsp, For Mounting as a Drive
```bash
https://winfsp.dev/rel/
```

### 3. Edit Environment Variable
**Steps:** Search **"env"** on your PC. Add the **Environment Variable Path** for the **"rclone"** executable file/app.

### 4. Configure Your Cloud Storage
```bash
rclone config
```
### 4. Test Cloud Link Status
```bash
rclone lsd megadrive1:
```
### 5. Mount Cloud Storage to PC Drive
```bash
rclone mount megadrive1: M: --vfs-cache-mode writes --poll-interval 5s
```
### 6. Terminate rclone Process Forcefully
```bash
taskkill /IM rclone.exe /F
```
