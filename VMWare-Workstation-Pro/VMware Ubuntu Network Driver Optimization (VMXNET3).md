# 🚀 VMware Ubuntu Network Driver Optimization (VMXNET3)

## 📌 Overview

This document explains **step-by-step** how to:

- 🔍 Identify the current VMware network driver in Ubuntu
- ⚡ Replace legacy `e1000` with high‑performance `vmxnet3`
- 🌐 Verify network connectivity
- 🔐 Permanently disable IPv6 (recommended for VPN & lab environments)

✅ This setup is ideal for:

- 🔒 VPN servers (OpenVPN / WireGuard)
- 🧪 Home labs
- 🖥️ VMware-based server testing

---

## 🖥️ Environment Details

- 💻 **Host OS:** Windows 11 (24H2)
- 🧰 **Hypervisor:** VMware Workstation
- 🐧 **Guest OS:** Ubuntu Server 64-bit

---

## 🔍 Step 1: Check Current Network Adapter & Driver

### 📡 Identify active network interface

```bash
ip route
```

### 🧾 Check network driver

```bash
ethtool -i ens33
```

If output shows:

```
driver: e1000
```

❌ This is a **legacy driver** and should be replaced for better performance.

---

## ⚡ Step 2: Switch to VMXNET3 Driver (Recommended)

### 💡 Why VMXNET3?

- 🚀 High throughput
- 🧠 Low CPU usage
- 🛡️ Stable & optimized for VPN/server workloads

---

### ⏹️ Step 2.1: Shut down the VM

```bash
sudo shutdown now
```

---

### 🛠️ Step 2.2: Modify VM configuration (Manual method)

> ✅ This method works even if the VMware UI does not show VMXNET3 option

1️⃣ Go to VM directory on **Windows host**:

```
C:\Users\<username>\Documents\Virtual Machines\<VM Name>\
```

2️⃣ Open the `.vmx` file using **Notepad (Run as Administrator)**

3️⃣ Add or modify this line:

**Old Line Shows Like This** `ethernet0.virtualDev = "e1000"` Replace With Below.

```ini
ethernet0.virtualDev = "vmxnet3"
```

4️⃣ 💾 Save the file and close it

5️⃣ ▶️ Start the VM

---

## ✅ Step 3: Verify Driver Change Inside Ubuntu

### 🔎 Check interface name

```bash
ip link
```

> ℹ️ Interface name may change (e.g. `ens33` → `ens160`)

### 🧪 Verify active driver

```bash
ethtool -i ens160
```

Expected output:

```
driver: vmxnet3
```

🎉 **Driver successfully upgraded!**

---

## 🔨 Step 4: Update Network Interface

### 📬 Check Interface Name

```bash
ifconfig -a
```

### 🌍 Edit/Update Network Interface With New Interface Name

```bash
sudo nano /etc/netplan/50-cloud-init.yaml
```

### ⏱️ Apply New Netplan

```bash
sudo netplan apply
```

> ℹ️ If IPv6 is enabled, ping may resolve to an IPv6 address. This is normal.

---

## 🌐 Step 5: Verify Network Connectivity

### 📬 Check IP address

```bash
ip addr show
```

### 🌍 Test internet access

```bash
ping google.com
```

> ℹ️ If IPv6 is enabled, ping may resolve to an IPv6 address. This is normal.

---

## 🔐 Step 6: Disable IPv6 Permanently (Recommended for VPN)

### ❓ Why disable IPv6?

- 🚫 Prevent IPv6 leaks in VPN
- 🔐 Simplify firewall & routing rules

---

### ✏️ Step 5.1: Edit sysctl configuration

```bash
sudo nano /etc/sysctl.conf
```

Add these lines at the end:

```conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

---

### ⚙️ Step 5.2: Apply changes

```bash
sudo sysctl -p
```

---

### 🔄 Step 5.3: Reboot system

```bash
sudo reboot
```

---

### 🔍 Step 5.4: Verify IPv6 is disabled

```bash
ip -6 addr
```

Expected result:

```
(no output)
```

---

## 📊 Final Checklist

✔️ Network driver: **vmxnet3**  
✔️ Interface state: **UP**  
✔️ IPv4 connectivity working  
✔️ IPv6 permanently disabled  
✔️ Optimized for VPN & lab use

---

## 🏁 Conclusion

🎯 Switching from `e1000` to **VMXNET3**:

- ⚡ Boosts network performance
- 🧠 Reduces CPU overhead
- 🛡️ Improves VPN stability
- 🔮 Future‑proofs VMware on Windows 11 24H2

✅ **Highly recommended for all serious VMware Ubuntu deployments.**
