# 🖥️ Set Static IP on Ubuntu Server Using Netplan

This guide explains how to assign a **static IP address** (e.g., `192.168.29.50`) to an **Ubuntu Server** using **Netplan**, and install essential networking packages.

---

## ✅ Requirements

- Ubuntu Server 20.04 or newer
- Network managed via Netplan
- Router IP: `192.168.29.1`
- Desired static IP: `192.168.29.50`

---

## 📦 Step 1: Install Required Packages

These packages are useful for remote access and networking tools.

```bash
sudo apt update
sudo apt install -y openssh-server net-tools
```

- `openssh-server`: Allows remote login via SSH.
- `net-tools`: Provides tools like `ifconfig`, `netstat`, etc.

---

## 🌐 Step 2. View Routing Table (Subnet & Gateway)

To view the kernel routing table and identify default gateway and subnet:

```
ip route
```
| Field             | Description                                         |
| ----------------- | --------------------------------------------------- |
| `default`         | Default route (used when no other route matches)    |
| `via`             | Gateway IP address (your router)                    |
| `dev`             | Network interface (e.g., `enp0s3`, `eth0`, `wlan0`) |
| `192.168.29.0/24` | Subnet range (CIDR notation)                        |
| `src`             | IP address assigned to this interface               |

---

## 📁 Step 3: Locate Netplan Configuration File

Open the terminal and run:

```bash
cd /etc/netplan
ls
```

You will likely see a file such as: `50-cloud-init.yaml`.

---

## Step 4: 🔁 To find your correct interface name, run:

```bash
ifconfig -a
```

## 📝 Step 5: Edit Netplan Configuration File

First, open the file with `nano`:

```bash
sudo nano /etc/netplan/50-cloud-init.yaml
```

Now **copy the configuration below and paste it into the file**, replacing any existing content:
or Use This File ➡️ **_[50-cloud-init.yaml](./50-cloud-init.yaml)_**

```yaml
network: # Main network configuration block
  version: 2 # Netplan config version (always 2 for modern systems)
  ethernets: # Ethernet interface section
    enp0s3: # Replace this with your actual network interface name (use `ip a` to check)
      dhcp4: no # Disables automatic IP assignment (DHCP)
      addresses: [192.168.29.50/24] # Replace with your desired static IP and subnet (e.g., 192.168.1.X/24)
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1] # Google and Cloudflare DNS
      routes:
        - to: default
          via: 192.168.29.1 # Replace with your router’s gateway IP (usually 192.168.1.1 or 192.168.0.1)
```

After editing, press `Ctrl + O`, then `Enter` to save, and `Ctrl + X` to exit.

---

## 💾 Step 6: Apply the Netplan Configuration

```bash
sudo netplan apply
```

---

## 🔍 Step 7: Verify the Static IP Address

```bash
ifconfig -a
```

Look for something like: `enp0s3 192.168.29.50/24`

---

## 🚫 Optional: Disable Cloud-Init Network Overrides

### 🔒 Method 1: Disable Cloud-Init Completely

```bash
sudo touch /etc/cloud/cloud-init.disabled
```

Reboot the system:

```bash
sudo reboot
```

To re-enable:

```bash
sudo rm /etc/cloud/cloud-init.disabled
```

---

### 🔒 Method 2: Disable Only Cloud-Init Networking

Create or edit:

```bash
sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

Add:

```yaml
network: { config: disabled }
```

Save and exit, then reboot:

```bash
sudo reboot
```

To revert:

```bash
sudo rm /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
```

---

## 📌 Step 6: Reserve IP in Router (Recommended)

To avoid conflicts, reserve IP `192.168.29.50` for your server’s MAC address in your router’s DHCP settings.

---

## ✅ Done!

Your Ubuntu server now has a **permanent static IP** using Netplan and includes essential networking tools. You're ready to SSH into your system remotely and manage it easily.

---

## ⭐ **_Learn What is cloud-init [Click Here To Know](./cloud-init.md)_**
