# Life Axis Theme — Pterodactyl Panel v1.15.1

![Life Axis Logo](https://img.shields.io/badge/Theme-Life%20Axis-8b5cf6?style=for-the-badge)
![Pterodactyl](https://img.shields.io/badge/Pterodactyl-v1.15.1-06b6d4?style=for-the-badge)
![Blueprint](https://img.shields.io/badge/Framework-Blueprint-10b981?style=for-the-badge)

**Life Axis** is a high-grade, futuristic dark theme and extension suite for **Pterodactyl Panel v1.15.1**, designed for modern game server hosting providers and power users.

---

## ⚡ Quick 1-Step Installation

### Method 1: Blueprint CLI (Recommended)
```bash
cd /var/www/pterodactyl
blueprint -i life-axis-theme.blueprint
```

### Method 2: Shell Script
```bash
cd /var/www/pterodactyl
curl -sSL https://raw.githubusercontent.com/lifeaxis/theme/main/install.sh | bash
```

---

## 📋 Features Included
- **All 23 Core Pages Redesigned**: Login, 2FA, Dashboard, Server List, Terminal, Overview, Files, Databases, Schedules, Users, Backups, Network, Startup, Settings, Account, API, Admin Panel, Admin Servers, Admin Users, Admin Nodes, Admin Locations, Admin Databases, Admin Settings.
- **Glassmorphic Glow Architecture**: Deep #0b0c10 charcoal backdrop paired with subtle Electric Violet and Cyan laser accents.
- **Zero Core Tampering**: 100% compliant with standard Pterodactyl authentication, CSRF, Wings sockets, and permissions.
- **Real-time Live Metrics**: Smooth animators for CPU, RAM, Disk, and Network I/O.
- **Ultra-Responsive**: Fully optimized for Desktop, Tablets, and Mobile touchscreens.

---

## 🔄 Upgrade & Rollback Commands

### Upgrade
```bash
cd /var/www/pterodactyl
blueprint -u life-axis-theme
php artisan view:clear
```

### Rollback / Uninstall
```bash
cd /var/www/pterodactyl
bash uninstall.sh
```
