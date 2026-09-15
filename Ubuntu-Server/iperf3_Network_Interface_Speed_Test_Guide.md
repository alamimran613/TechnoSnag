# 🚀 Network Interface Speed Test Guide (iperf3)

## 📌 Purpose
This document explains **step-by-step** how to test and compare **network interface throughput**
(e.g. **VMXNET3 vs E1000**) using **iperf3** on **any Linux system or virtual machine**.

This guide works for:
- 🖥️ Physical servers
- 🧪 Virtual machines (VMware, VirtualBox, Proxmox)
- 🔒 VPN & networking labs

---

## 🧰 Tools Required
- 🐧 Linux system (Ubuntu recommended)
- 🌐 Network connectivity between two systems
- 📊 `iperf3` (throughput testing tool)

---

## 🏗️ Test Architecture

[ Client Machine ] ----LAN/VPN----> [ Server Machine ]  
iperf3 -c                              iperf3 -s

👉 One system acts as **server**, the other as **client**.

---

## 🧾 Step 1: Identify Network Interface & Driver

### 🔍 Check active interface
```bash
ip route
```

### 🧠 Check interface driver
```bash
ethtool -i <interface>
```

Example:
```bash
ethtool -i ens160
```

Look for:
- ✅ `vmxnet3` (high performance)
- ❌ `e1000` (legacy, slow)

---

## 📦 Step 2: Install iperf3 (Both Systems)

### 📥 On Ubuntu / Debian
```bash
sudo apt update
sudo apt install iperf3 -y
```

Verify:
```bash
iperf3 --version
```

---

## 🖥️ Step 3: Start iperf3 Server

### ▶️ On SERVER machine
```bash
iperf3 -s
```

Expected:
```
Server listening on 5201
```

📌 Port `5201` is default.

---

## 💻 Step 4: Run iperf3 Client Test

### ▶️ On CLIENT machine
```bash
iperf3 -c <SERVER_IP>
```

Example:
```bash
iperf3 -c 192.168.29.105
```

⏱️ Default test duration: **10 seconds**.

---

## 📊 Step 5: Understand Output

Example:
```
[ ID] Interval       Transfer     Bitrate
[  5] 0.00-10.00 sec  1.60 GBytes  1.37 Gbits/sec
```

### 📈 Key metrics
- **Transfer** → Total data sent
- **Bitrate** → Interface throughput (MOST IMPORTANT)
- **Retr** → Packet retransmissions

---

## 🔁 Step 6: Parallel Stream Test (Real-World Load)

```bash
iperf3 -c <SERVER_IP> -P 4
```

📌 Simulates:
- VPN traffic
- Multiple users
- Real application load

---

## 🧠 Step 7: CPU Usage Comparison (Optional)

In another terminal:
```bash
htop
```

Observe:
- ❌ e1000 → High CPU usage
- ✅ vmxnet3 → Low & stable CPU usage

---

## 🧪 Step 8: Compare Results (Example)

| Interface Driver | Throughput |
|-----------------|------------|
| ❌ E1000 | ~600 Mbps |
| ✅ VMXNET3 | ~1.3 Gbps |

🚀 **VMXNET3 is ~2× faster** under identical conditions.

---

## ⚠️ Common Errors & Fixes

### ❗ Port already in use
```
error: Address already in use
```

Fix:
```bash
sudo pkill iperf3
```
OR use another port:
```bash
iperf3 -s -p 5202
iperf3 -c <SERVER_IP> -p 5202
```

---

## 🎯 Best Practices
- ✅ Same network & MTU
- ✅ Same CPU & RAM (for fair comparison)
- ❌ Don’t use internet speed tests for NIC comparison
- ✅ Use `iperf3` for accurate results

---

## 🏁 Conclusion

🎉 Using `iperf3`, you can **clearly prove**:
- Which network driver is faster
- How much throughput your interface supports
- Why **VMXNET3 outperforms E1000**

📌 This method is **reliable, repeatable, and production-grade**.

---

## 📎 Quick Command Summary

```bash
# Server
iperf3 -s

# Client
iperf3 -c <SERVER_IP>

# Parallel test
iperf3 -c <SERVER_IP> -P 4
```
