# 🐧 Linux Auto Update 🔄

Automate updates for your Debian/Ubuntu system with a simple script that runs automatically at boot and is scheduled to execute twice a day (07:00 and 19:00). It also allows for quick manual updates via the terminal.

---

## ✨ Key Features

- Automatic updates twice a day via systemd timer
- Automatic updates at system startup (boot)
- Manual updates via `update` command
- Simple and easy-to-maintain structure
- No external dependencies other than systemd and apt

---

## 📦 Requirements

- Debian or Ubuntu
- sudo
- git
- systemd

---

## 🚀 Installation

Make sure you have the required packages:

```bash
sudo apt update && sudo apt install -y sudo git
````

Clone the repository:

```bash
git clone https://github.com/MatheusFLB/linux-auto-update.git
cd linux-auto-update
```

Project structure:

```
linux-auto-update/
├── README.md
├── linux-auto-update/
│   ├── deploy.sh               # Full deployment script
│   ├── update.sh               # System update script
└── systemd/
    ├── auto-update.service     # Runs update.sh once when triggered on boot
    └── auto-update.timer       # Schedules auto-update.service twice daily (07:00 & 19:00)
```

Make the main script executable:

```bash
chmod +x linux-auto-update/deploy.sh
```

Run the deploy script (execute as root):

```bash
sudo ./linux-auto-update/deploy.sh
```

---

## 🧠 How it Works

* `update.sh` contains the commands to update the system (`apt update && apt full-upgrade -y && apt autoremove -y`).
* The systemd service `auto-update.service` runs the update script once when triggered.
* The systemd timer `auto-update.timer` schedules the service to run twice a day (07:00 and 19:00).
* At system startup, the service runs automatically thanks to `WantedBy=multi-user.target`.
* To update manually, simply type in the terminal:

```bash
update
```

(This command is an alias to run `/usr/local/bin/auto-update.sh` with sudo permissions.)

---

## 🔐 Security Notes

* Runs as root via systemd, ensuring proper permissions.
* No external data transfer or open ports.
* Simple and transparent code, easy to audit.
* Recommended for controlled environments to prevent unexpected updates.

---

## 🛠 Typical Use Cases

| Use Case             | Description                                           |
| -------------------- | ----------------------------------------------------- |
| Servers              | Automated maintenance for Debian/Ubuntu servers       |
| Desktop/Laptop       | Keep home or office machines always updated           |
| Lab/Dev Environments | Safe, automated updates in test setups                |
| VPS / Containers     | Minimal manual intervention for lightweight instances |

---

# 👤 Author

Project created by **[Matheus Bissoli](https://www.linkedin.com/in/matheusbissoli/)** – simple and efficient automation to keep your Linux always updated.
