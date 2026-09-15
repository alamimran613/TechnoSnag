# 🕒 Linux Date, Time & NTP Management Guide

This guide covers basic commands to view, modify, and manage date, time, timezone, and NTP services in Linux.

---

## 📅 1. Check Current Date & Time

```bash
date
```

**Info:**
Displays the current system date, time, timezone, and year. This is the default command to quickly check system time.

---

## 📆 2. Show Full Date with Year (Custom Format)

```bash
date "+%A, %d %B %Y %H:%M:%S %Z"
```

**Info:**
Shows a detailed and human-readable format including:

- Full day name (e.g., Friday)
- Full month name (e.g., April)
- Year
- Time with seconds
- Timezone

---

## 🧾 3. Show Date Using Locale Format

```bash
date "+%c"
```

**Info:**
Displays date and time based on your system’s locale settings.
This is a quick way to get a **complete formatted output** without manually specifying format options.

---

## 🌏 4. Change Timezone to Asia/Kolkata

```bash
sudo timedatectl set-timezone Asia/Kolkata
```

**Info:**
Changes system timezone to **Indian Standard Time (IST)**.
Useful when your system is set to UTC or another timezone.

---

## 🔍 5. Check NTP Service Status

```bash
timedatectl status
```

**Info:**
Displays detailed time settings including:

- NTP service status (active/inactive)
- Time synchronization status
- Local and universal time

---

## ❌ 6. Disable NTP Service

```bash
timedatectl set-ntp false
```

**Info:**
Disables automatic time synchronization with internet servers.
Required if you want to manually control system time.

---

## ⏰ 7. Change Date & Time Manually

```bash
sudo date -s "2020-10-22 17:30:00"
```

**Info:**
Manually sets system date and time.

Format:

```
YYYY-MM-DD HH:MM:SS
```

⚠️ Requires `sudo` (administrator privileges)

## ✅ 8. Enable NTP Service

```bash
timedatectl set-ntp true
```

**Info:**
Enables automatic time synchronization using NTP servers.
Recommended for keeping accurate system time.

---

## 💡 Notes

- Use `sudo` for commands that modify system settings
- Disabling NTP allows manual time changes
- Enabling NTP overrides manual time with accurate internet time
- Timezone does not change actual time, only how it is displayed

---

## 🚀 Summary

| Task              | Command                                 |
| ----------------- | --------------------------------------- |
| Check date        | `date`                                  |
| Full date format  | `date "+%A, %d %B %Y %H:%M:%S %Z"`      |
| Locale-based date | `date "+%c"`                            |
| Change timezone   | `timedatectl set-timezone Asia/Kolkata` |
| Set date/time     | `date -s "YYYY-MM-DD HH:MM:SS"`         |
| Check NTP         | `timedatectl status`                    |
| Disable NTP       | `timedatectl set-ntp false`             |
| Enable NTP        | `timedatectl set-ntp true`              |

---
