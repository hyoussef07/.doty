#!/usr/bin/env bash
# Update system and flake inputs

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🔄 Updating NixOS system...${NC}"

# Check if we're in the right directory
if [ ! -f "flake.nix" ]; then
    echo -e "${RED}❌ Error: flake.nix not found. Are you in the dotfiles directory?${NC}"
    exit 1
fi

# Update flake.lock
echo -e "${YELLOW}📦 Updating flake inputs...${NC}"
nix flake update

# Update system
echo -e "${YELLOW}🔨 Updating system...${NC}"
sudo nixos-rebuild switch --flake .#nixos --upgrade

# Clean old generations (optional)
echo -e "${YELLOW}🧹 Cleaning old generations...${NC}"
sudo nix-collect-garbage --delete-older-than 7d

# Optimize nix store
echo -e "${YELLOW}📦 Optimizing nix store...${NC}"
nix store optimise

echo -e "${GREEN}✅ Update complete!${NC}"
