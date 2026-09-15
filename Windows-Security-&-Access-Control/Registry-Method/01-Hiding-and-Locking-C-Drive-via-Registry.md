# 🔐 Hiding and Locking C Drive via Registry

> 🪟 **Windows Registry Guide** — Follow the steps below to hide the C Drive and restrict direct access to it.

---

## 👻 Step 1: Hide C Drive from "This PC" (`NoDrives`)

> 🎯 **Purpose:** This step removes the C Drive icon from the File Explorer interface so it is no longer visible to users.

### 🛠️ Steps

1. ⌨️ Press **`Windows + R`** on your keyboard to open the Run dialog.
2. 📝 Type **`regedit`** and press Enter to open the Registry Editor.
3. 🧭 Navigate to the following path in the left sidebar:

   ```text
   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer
   ```

   > 💡 **Note:** If the `Explorer` folder does not exist under `Policies`, right-click on `Policies` > **New > Key** and name it **Explorer**.

4. ➕ Click on the `Explorer` folder, then right-click on the empty space on the right side panel and select **New > DWORD (32-bit) Value**.
5. 🏷️ Name this new value exactly **`NoDrives`**.
6. 🔢 Double-click on `NoDrives`, select **Decimal**, and type **`4`** as the Value data, then click **OK**.  
   > 🔎 The number `4` corresponds specifically to hiding the C Drive.

---

## 🚫 Step 2: Block Access and Prevent File Location Opening (`NoViewOnDrive`)

> 🛡️ **Purpose:** This step ensures that even if a shortcut, command, or direct path tries to access the C Drive, Windows will block it and throw a restriction error.

### 🛠️ Steps

1. ➕ In the same `Explorer` registry key location, right-click on the empty space again and select **New > DWORD (32-bit) Value**.
2. 🏷️ Name this new value exactly **`NoViewOnDrive`**.
3. 🔢 Double-click on `NoViewOnDrive`, select **Decimal**, and type **`4`** as the Value data, then click **OK**.
4. 🔄 Close the Registry Editor and **Restart your PC** for the changes to take full effect.

---

## 📋 Summary: What Each Setting Does

| ⚙️ Setting | 🔢 Value | 📌 What it does | ✅ Result |
|---|---:|---|---|
| `NoDrives` | `4` | It modifies the Windows shell interface to hide the C Drive icon completely under "This PC" and standard open/save dialog boxes. | Users cannot see the C Drive listed as an available partition. |
| `NoViewOnDrive` | `4` | It places a security block on accessing the contents of the C Drive via File Explorer or shortcut paths. | If a user tries to right-click an app shortcut and select *"Open file location"* or attempts to browse the drive directly, Windows blocks the action and displays a restriction error message (*"This operation has been cancelled due to restrictions in effect on this computer"*). |

---

## ⚙️ Application Background Functionality

> 💡 **Important:** Despite these interface blocks and view restrictions, background applications (like VLC, media tools, or your primary software) retain execution rights. They can still smoothly read and write their necessary files from the C Drive in the background without exposing the directory to the user.

---

### 📌 Quick Reference

- 👻 **`NoDrives = 4`** → Hide the C Drive
- 🚫 **`NoViewOnDrive = 4`** → Block direct access to the C Drive
- 🔄 **Restart the PC** → Apply the changes fully

> ⚠️ **Tip:** Make sure you follow each Registry step carefully. Incorrect Registry changes can affect Windows behavior.

---

⭐ If this guide was helpful, consider sharing it with others learning Windows administration.
