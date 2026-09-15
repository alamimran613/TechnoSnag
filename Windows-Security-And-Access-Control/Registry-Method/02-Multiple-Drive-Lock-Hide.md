# Step-by-Step Guide: Hiding and Locking Multiple Drives via Registry

> <mark> ⚠️ **Warning**: Take `Backup/Create System Restore Point` Before Making Changes in Your Working System. </mark>

#### Step 1: Calculate the Drive Number Value

Each hard drive partition in Windows is assigned a specific binary/decimal value. To hide multiple drives at the same time, you must add their individual numbers together to get a single combined total.

- **A Drive:** 1
- **B Drive:** 2
- **C Drive:** 4
- **D Drive:** 8
- **E Drive:** 16
- **F Drive:** 32
- **G Drive:** 64

_Examples of Combined Values:_

- _To hide only C Drive:_ Use **`4`**
- _To hide C and D Drives:_ `4 + 8` = **`12`**
- _To hide C, D, and E Drives:_ `4 + 8 + 16` = **`28`**

---

#### Step 2: Apply the Combined Value to Hide the Drives (`NoDrives`)

This step removes the icons of the specified drives from the File Explorer (`This PC`) interface.

1. Press **`Windows + R`** on your keyboard to open the Run dialog.
2. Type **`regedit`** and press Enter to open the Registry Editor.
3. Navigate to the following path in the left sidebar:
   `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer`
   _(Note: If the `Explorer` folder does not exist under `Policies`, right-click on `Policies` > **New > Key** and name it **Explorer**)._
4. Click on the `Explorer` folder, then right-click on the empty space on the right-side panel and select **New > DWORD (32-bit) Value**.
5. Name this new value exactly **`NoDrives`**.
6. Double-click on `NoDrives`, select **Decimal**, and type your **calculated total sum** (for example, `4` for C only, or `12` for C and D) into the Value data box, then click **OK**.

---

#### Step 3: Block Access to the Hidden Drives (`NoViewOnDrive`)

This step ensures that users cannot bypass the hidden view by typing direct file paths or using shortcuts to access the protected drives.

1. In the same `Explorer` registry key location, right-click on the empty space again and select **New > DWORD (32-bit) Value**.
2. Name this new value exactly **`NoViewOnDrive`**.
3. Double-click on `NoViewOnDrive`, select **Decimal**, and type the **exact same calculated total sum** used in Step 2, then click **OK**.
4. Close the Registry Editor and **Restart your PC** for the changes to take full effect.

---

### Summary: What Each Setting Does

- **`NoDrives` (Combined Decimal Value):**
- **What it does:** Instructs the Windows shell interface to hide the icon representation of the specified drive letters under "This PC" and standard open/save file dialog boxes.
- **Result:** Users cannot see the targeted drives listed as available partitions.

- **`NoViewOnDrive` (Combined Decimal Value):**
- **What it does:** Places a strict system block on accessing the contents or folder directories of those specific drive letters via shortcuts, command prompts, or direct paths.
- **Result:** If a user attempts to view or browse the restricted drives, Windows blocks the attempt and throws a restriction error message (_"This operation has been cancelled due to restrictions in effect on this computer"_).
