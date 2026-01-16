# 🚀 Quick Start Guide

## ⚠️ IMPORTANT: Read This First!

**Before using this config**, you MUST complete the bootstrap steps!

👉 **Read [DEPLOYMENT.md](DEPLOYMENT.md) first!** 

It covers:
- Enabling flakes on your system
- Generating your hardware config
- Critical setup steps

---

## Prerequisites

✅ Fresh NixOS installation  
✅ Flakes enabled (see DEPLOYMENT.md)  
✅ Git installed  
✅ Hardware config generated

## 1️⃣ Generate Hardware Config

```bash
sudo nixos-generate-config --show-hardware-config > /tmp/hardware.nix
```

Open `/tmp/hardware.nix` and copy these sections to `hosts/nixos/hardware.nix`:
- `boot.initrd.availableKernelModules`
- `boot.initrd.kernelModules` 
- `boot.kernelModules`
- `fileSystems` (all mounts)
- Verify `swapDevices` path

## 2️⃣ Clone This Repo

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
```

## 3️⃣ Choose Your Role(s)

Edit `hosts/nixos/default.nix`:

```nix
# Uncomment the profiles you want:
imports = [
  # ...
  
  ../../profiles/development-role.nix  # ✓ Enabled by default
  # ../../profiles/gaming-role.nix     # Uncomment for gaming
  # ../../profiles/normalmode-role.nix # Uncomment for everyday use  
  # ../../profiles/study-role.nix      # Uncomment for study tools
];
```

**You can enable multiple profiles at once!**

## 4️⃣ Initialize & Build

```bash
# Update flake inputs
nix flake update

# Test build (doesn't activate)
sudo nixos-rebuild test --flake .#nixos

# Deploy (make it permanent)
sudo nixos-rebuild switch --flake .#nixos
```

## 5️⃣ Reboot

```bash
sudo reboot
```

## 6️⃣ First Login

1. Login with user `dx07844` at SDDM
2. Set password: `passwd`
3. Hyprland will start automatically

## 🎮 Essential Keybindings

| Key | Action |
|-----|--------|
| `Super + Return` | Open terminal (Kitty) |
| `Super + B` | Open browser (Brave) |
| `Super + D` | App launcher (Wofi) |
| `Super + E` | File manager (Thunar) |
| `Super + Q` | Close window |
| `Super + 1-9` | Switch workspace |
| `Super + Shift + 1-9` | Move window to workspace |
| `Print` | Screenshot area |
| `Shift + Print` | Screenshot screen |
| `Super + C` | Clipboard history |

## 🔧 Modify Configuration

```bash
cd ~/dotfiles

# Edit what you want
nvim hosts/nixos/default.nix

# Rebuild
sudo nixos-rebuild switch --flake .#nixos
```

## 📦 Update System

```bash
cd ~/dotfiles
./scripts/update.sh
```

## 🆘 Need Help?

Check:
- [README.md](README.md) - Full documentation
- [VERIFICATION.md](VERIFICATION.md) - Structure details
- Hyprland logs: `cat ~/.cache/hyprland/hyprland.log`
- System logs: `journalctl -b -u display-manager`

---

**That's it! You're ready to go! 🎉**
