#!/usr/bin/env bash
# Deploy NixOS configuration

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Deploying NixOS configuration...${NC}"

# Check if we're in the right directory
if [ ! -f "flake.nix" ]; then
    echo -e "${RED}❌ Error: flake.nix not found. Are you in the dotfiles directory?${NC}"
    exit 1
fi

# Update flake.lock
echo -e "${YELLOW}📦 Updating flake inputs...${NC}"
nix flake update

# Build configuration
echo -e "${YELLOW}🔨 Building configuration...${NC}"
sudo nixos-rebuild switch --flake .#nixos

echo -e "${GREEN}✅ Deployment complete!${NC}"
