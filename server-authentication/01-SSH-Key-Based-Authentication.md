# 🔐 SSH Key-Based Authentication Setup

A complete step-by-step guide to setting up **SSH key-based authentication** on Linux servers (**`Ubuntu, Debian, CentOS, etc.`**).

---

## 📌 Table of Contents

- [🧠 Introduction](#-introduction)
- [🔑 Step 1: Generate SSH Keys](#-step-1-generate-ssh-keys)
- [📤 Step 2: Copy Public Key to Server](#-step-2-copy-public-key-to-server)
- [🔐 Step 3: Set Permissions](#-step-3-set-permissions)
- [🧪 Step 4: Test Login](#-step-4-test-login)
- [⚙️ Step 5: Server Configuration (Advanced)](#️-step-5-server-configuration-advanced)
- [🔐 Step 6: Disable Password Login (If Needed)](#-step-6-disable-password-login-if-needed)
- [🔐 RSA vs ED25519](#-rsa-vs-ed25519)
- [⚠️ Troubleshooting](#️-troubleshooting)
- [🔥 Best Practices](#-best-practices)
- [🧠 Summary](#-summary)
- [⭐ Support](#-support)

---

## 🧠 Introduction

SSH key authentication uses:

- 🔒 **Private Key** → Stored on your local machine (keep secret)
- 🔓 **Public Key** → Stored on server (`authorized_keys`)

👉 Provides secure login without passwords.

---

## 🔑 Step 1: Generate SSH Keys

```bash
ssh-keygen -t ed25519 -C "your_label"
```

### 🔍 Explanation

- `ssh-keygen` → Generates SSH keys
- `-t` → Specifies key type
- `ed25519` → Modern secure algorithm
- `-C` → Comment (identifier only, e.g. - `my-server-key`)

---

### 📁 Key Naming, Storage & Passphrase

When prompted:

```bash
Enter file in which to save the key (/home/user/.ssh/id_ed25519):
```

| Input              | Result Location           | Keys Name                                   |
| ------------------ | ------------------------- | ------------------------------------------- |
| Press Enter        | `~/.ssh/` (default)       | `id_ed25519` & `id_ed25519.pub`             |
| `example_key_name` | Current working directory | `example_key_name` & `example_key_name.pub` |

### 🔐 Passphrase (Next Prompt)

After saving the key, you will see:

```bash
Enter passphrase (empty for no passphrase):
```

- A **passphrase** is an extra security layer for your private key
- If set, it will be required when using the key for login
- Leave empty → faster login (less secure)
- Set passphrase → more secure (recommended)

👉 Example flow:

```bash
Enter passphrase:
Enter same passphrase again:
```

---

## 📤 Step 2: Copy Public Key to Server

### ✅ Method 1: Automatic (Recommended)

`Navigate To Working Directory of Generated Keys`

```bash
ssh-copy-id -i example_key_name.pub user@server_ip
```

✔ Automatically:

- Creates `.ssh` directory (if missing)
- Adds key to `authorized_keys`
- Sets correct permissions

---

### 📁 Method 2: Manual

#### 1. Show public key (Local)

```bash
cat ~/example_key_name.pub
```

Copy the output.

---

#### 2. Login to server

```bash
ssh user@server_ip
```

---

### 3: Prepare `.ssh` Directory (Server)

```bash
mkdir -p ~/.ssh
```

---

### Add your key

```bash
nano ~/.ssh/authorized_keys
```

Paste the public key.

---

## 🔐 Step 3: Set Permissions

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

---

## 🧪 Step 4: Test Login

```bash
ssh -i example_key_name user@server_ip
```

✔ Should login without password

---

## ⚙️ Step 5: Server Configuration (Advanced)

- <mark>**Note: If key-based authentication fails, refer to the troubleshooting steps below. These steps are also useful for advanced configuration when needed.**</mark>

```bash
sudo nano /etc/ssh/sshd_config
```

Ensure:

```bash
PubkeyAuthentication yes
```

---

## 🔐 Step 6: Disable Password Login (If Needed)

```bash
PasswordAuthentication no
KbdInteractiveAuthentication no
```

Optional:

```bash
PermitRootLogin no
```

---

### 🔄 Restart SSH

```bash
sudo systemctl restart ssh    # Ubuntu/Debian
sudo systemctl restart sshd   # CentOS/RHEL
```

---

## 🔐 RSA vs ED25519

### 🧱 RSA

```bash
ssh-keygen -t rsa -b 4096 -C "your_label"
```

- Uses **4096 bits**
- Older algorithm
- Slower

#### 🔍 Command explanation

- `ssh-keygen` → Tool to generate SSH keys
- `-t rsa` → Specifies RSA algorithm
- `-b 4096` → Key size (**4096 bits**, strong security)
- `-C "your_label"` → Comment (identifier, e.g. `my-server-key`)

---

### ⚡ ED25519

```bash
ssh-keygen -t ed25519 -C "your_label"
```

- Modern & faster
- Smaller keys (~256-bit equivalent)
- Recommended

### 🔍 Explanation

- `ssh-keygen` → Generates SSH keys
- `-t` → Specifies key type
- `ed25519` → Modern secure algorithm
- `-C` → Comment (identifier only, e.g. - `my-server-key`)

---

### 📏 Bits vs Bytes

- 1 byte = 8 bits
- 4096 bits = **512 bytes**

---

### 📊 Comparison

| Feature        | RSA 🧱                   | ED25519 ⚡                      |
| -------------- | ------------------------ | ------------------------------- |
| Math base      | Prime factorization      | Elliptic curves (ECC)           |
| Key size       | 2048–4096 bits           | ~256-bit                        |
| Speed          | Slower                   | Faster                          |
| Security level | Strong (needs large key) | Strong (efficient design)       |
| Modern use     | Legacy / compatibility   | Recommended                     |
| Default key    | `id_rsa` & `id_rsa.pub`  | `id_ed25519` & `id_ed25519.pub` |

---

## ⚠️ Troubleshooting

### Permission issues

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

---

### Wrong key used

```bash
ssh -i ~/.ssh/my_key user@server_ip
```

---

### SELinux (CentOS/Fedora)

```bash
restorecon -Rv ~/.ssh
```

---

## 🔥 Best Practices

- ✅ Use ED25519 keys
- ✅ Store keys in `~/.ssh/`
- ✅ Use meaningful key names
- ✅ Disable password login
- ✅ Disable root login
- ✅ Use passphrase
- ❌ Never share private key

---

## 🧠 Summary

- SSH keys replace passwords with secure authentication
- No need to enable key auth manually
- Keys are user-specific
- File location depends on path provided
- RSA uses **bits**, not bytes
- ED25519 is modern and recommended

---

## ⭐ Support

If this helped you:

- ⭐ Star the repo
- 📢 Share with others
- 🚀 Follow for more tech guides

---
