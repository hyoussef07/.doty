#!/usr/bin/env bash
# Backup important configuration files

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

BACKUP_DIR="$HOME/nixos-backups/$(date +%Y-%m-%d_%H-%M-%S)"

echo -e "${GREEN}💾 Creating backup...${NC}"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup hardware configuration
echo -e "${YELLOW}Backing up hardware configuration...${NC}"
sudo cp /etc/nixos/hardware-configuration.nix "$BACKUP_DIR/" 2>/dev/null || true

# Backup current generation
echo -e "${YELLOW}Backing up current generation info...${NC}"
nixos-version > "$BACKUP_DIR/nixos-version.txt"
nix flake metadata . > "$BACKUP_DIR/flake-metadata.txt" 2>/dev/null || true

# List installed packages
echo -e "${YELLOW}Listing installed packages...${NC}"
nix-env -q > "$BACKUP_DIR/user-packages.txt"

echo -e "${GREEN}✅ Backup complete: $BACKUP_DIR${NC}"
