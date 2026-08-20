#!/bin/bash
# ==============================================================================
# Life Axis Theme v1.15.1 — Automated Installer
# Compatible with Pterodactyl Panel v1.15.1 & Blueprint Framework
# ==============================================================================

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}"
echo "  _     _  __         _         _     "
echo " | |   (_)/ _|___    / \__  __ (_)___ "
echo " | |   | | |_/ _ \  / _ \ \/ / | / __|"
echo " | |___| |  _|  __/ / ___ \>  <  | \__ \"
echo " |_____|_|_|  \___|/_/   \/_/\_\_|_|___/"
echo " Premium Game Server Infrastructure Theme v1.15.1"
echo -e "${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[ERROR] Please run this installer as root (sudo bash install.sh)${NC}"
  exit 1
fi

PANEL_DIR="/var/www/pterodactyl"

if [ ! -d "$PANEL_DIR" ]; then
  echo -e "${RED}[ERROR] Pterodactyl directory not found at $PANEL_DIR${NC}"
  exit 1
fi

cd "$PANEL_DIR"

echo -e "${CYAN}[1/5] Creating safe rollback backup...${NC}"
mkdir -p "$PANEL_DIR/backups/life-axis-pre-install"
cp -r "$PANEL_DIR/resources" "$PANEL_DIR/backups/life-axis-pre-install/"
cp -r "$PANEL_DIR/public" "$PANEL_DIR/backups/life-axis-pre-install/"
echo -e "${GREEN}Backup saved to $PANEL_DIR/backups/life-axis-pre-install/${NC}"

echo -e "${CYAN}[2/5] Installing Life Axis extension files via Blueprint...${NC}"
if command -v blueprint &> /dev/null; then
  blueprint -i life-axis-theme
else
  echo "Blueprint CLI not detected. Deploying via direct asset injection..."
  mkdir -p "$PANEL_DIR/public/themes/life-axis"
  cp -r assets/* "$PANEL_DIR/public/themes/life-axis/"
fi

echo -e "${CYAN}[3/5] Compiling front-end assets...${NC}"
if command -v yarn &> /dev/null; then
  yarn build:production || true
fi

echo -e "${CYAN}[4/5] Setting correct permissions...${NC}"
chown -R www-data:www-data "$PANEL_DIR"/*
chmod -R 755 "$PANEL_DIR/storage" "$PANEL_DIR/bootstrap/cache"

echo -e "${CYAN}[5/5] Flushing view and config caches...${NC}"
php artisan view:clear
php artisan config:clear
php artisan cache:clear

echo -e "${GREEN}"
echo "================================================================="
echo "  Life Axis Theme successfully installed on Pterodactyl v1.15.1!"
echo "================================================================="
echo -e "${NC}"
