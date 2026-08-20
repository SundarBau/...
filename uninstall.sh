#!/bin/bash
# ==============================================================================
# Life Axis Theme v1.15.1 — Rollback & Uninstaller
# ==============================================================================

set -e
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

PANEL_DIR="/var/www/pterodactyl"
BACKUP_DIR="$PANEL_DIR/backups/life-axis-pre-install"

echo -e "${CYAN}[1/3] Rolling back to pre-install state...${NC}"

if [ -d "$BACKUP_DIR" ]; then
  cp -r "$BACKUP_DIR/resources" "$PANEL_DIR/"
  cp -r "$BACKUP_DIR/public" "$PANEL_DIR/"
  echo -e "${GREEN}Pre-install assets restored from backup!${NC}"
else
  echo "Rebuilding original Pterodactyl assets via Yarn..."
  cd "$PANEL_DIR"
  php artisan view:clear
  yarn build:production
fi

echo -e "${CYAN}[2/3] Resetting permissions...${NC}"
chown -R www-data:www-data "$PANEL_DIR"/*

echo -e "${CYAN}[3/3] Clearing caches...${NC}"
cd "$PANEL_DIR"
php artisan view:clear
php artisan cache:clear
php artisan config:clear

echo -e "${GREEN}Life Axis uninstalled cleanly. Original theme active.${NC}"
