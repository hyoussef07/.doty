#!/usr/bin/env bash
# Verification script for NixOS dotfiles

echo "🔍 Verifying NixOS Dotfiles Structure..."
echo ""

# Check required files exist
echo "📁 Checking main files..."
required_files=(
    "flake.nix"
    "hosts/nixos/default.nix"
    "hosts/nixos/hardware.nix"
    "hosts/nixos/laptop.nix"
    "home/dx07844/default.nix"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✓ $file"
    else
        echo "✗ MISSING: $file"
    fi
done

echo ""
echo "📦 Checking profiles..."
profiles=(
    "profiles/base.nix"
    "profiles/development-role.nix"
    "profiles/gaming-role.nix"
    "profiles/normalmode-role.nix"
    "profiles/study-role.nix"
)

for profile in "${profiles[@]}"; do
    if [ -f "$profile" ]; then
        echo "✓ $profile"
    else
        echo "✗ MISSING: $profile"
    fi
done

echo ""
echo "⚙️ Checking modules..."
modules_count=$(find modules -name "*.nix" | wc -l)
echo "✓ Found $modules_count module files"

echo ""
echo "🏠 Checking home-manager structure..."
home_configs=$(find home/dx07844/config -name "*.nix" | wc -l)
home_packages=$(find home/dx07844/packages -name "*.nix" | wc -l)
echo "✓ Config files: $home_configs"
echo "✓ Package files: $home_packages"

echo ""
echo "🚀 All checks complete!"
