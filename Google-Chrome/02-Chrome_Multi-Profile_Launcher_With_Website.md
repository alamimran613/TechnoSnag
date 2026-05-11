# 🌐 Chrome Multi-Profile Website Launcher

Launch Different Websites Automatically With Different Chrome Profiles Using A Simple Batch Script.

<mark>**_Read Chrome Multi-Profile Launcher First Before proceed → [Click Here To Read](./01-Chrome_Multi-Profile_Launcher.md)_**</mark>

---

## ✨ Features

- ✅ Open Multiple Chrome Profiles In One Click
- ✅ Automatically Open Websites
- ✅ Separate Websites For Separate Profiles
- ✅ Beginner Friendly
- ✅ Easy To Edit And Customize
- ✅ Lightweight BAT Script
- ✅ Works On Windows 10 & Windows 11

---

## 📜 Batch Script

```bat
@echo off

:: ============================================
:: Created By TechnoSnag
:: YouTube - https://www.youtube.com/@TechnoSnag
:: ============================================

title Chrome Website Profile Launcher

:: Open Default Chrome Profile
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Default"

:: JasonBrowdyGaming
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 14" "https://www.youtube.com/@TechnoSnag"

:: Tiny Pirate
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 18" "https://www.youtube.com/@TechnoSnag" "https://www.instagram.com/TechnoSnag"

exit
```

---

# 🧠 Script Explanation

- `@echo off` → Hide Command Output For Cleaner Execution
- `title Chrome Website Profile Launcher` → Set Custom CMD Window Title
- `start ""` → Launch A New Chrome Window
- `"chrome.exe"` → Google Chrome Application Path
- `--profile-directory="Default"` → Open Default Chrome Profile Without Any Website
- `--profile-directory="Profile 14"` → Open Specific Chrome Profile
- `--profile-directory="Profile 18"` → Open Specific Chrome Profile
- `"https://www.youtube.com/@TechnoSnag"` → Automatically Open YouTube Channel
- `"https://www.instagram.com/TechnoSnag"` → Automatically Open Instagram Page
- `:: Comment Text` → Used For Labels And Better Readability
- `exit` → Close CMD Window Automatically

> <mark>Note: A Chrome default profile is the **initial user profile directory (named "Default") created automatically when Chrome is installed.**</mark>

---

## 🔍 How It Works

### 🟢 Default Profile

This Profile Will Open Normally Without Any Website.

---

### 🟢 Profile 14

This Profile Will Automatically Open:

```text
https://www.youtube.com/@TechnoSnag
```

---

### 🟢 Profile 18

This Profile Will Automatically Open:

```text
https://www.youtube.com/@TechnoSnag
https://www.instagram.com/TechnoSnag
```

---

## ✏️ How To Add Your Own Websites

Simply Add More URLs After The Profile Name.

Example:

```bat
start "" "C:\Program Files\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 18" "https://google.com" "https://github.com" "https://youtube.com"
```

---

## 💾 How To Save and Run The Script

### 📝 Follow Below Steps:

1. Open **Notepad**
2. Paste The Script
3. Click: File → Save As
4. Save File As: chrome-websites.bat
5. Change Save Type To: All Files
6. Double Click The `BAT` File To Run 🚀

---

## 📌 Notes

- ⚠️ Google Chrome Must Be Installed In Default Location
- ⚠️ Profile Names May Be Different On Your PC
- ⚠️ You Can Add Unlimited Websites
- ⚠️ Each Website Opens In The Assigned Profile
- ⚠️ Edit Profile Numbers Based On Your System

---

## ❤️ Support

If This Project Helped You, Consider Supporting The Channel.

🎥 YouTube: https://www.youtube.com/@TechnoSnag

---
