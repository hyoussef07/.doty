# 🚀 .doty - NixOS Hyprland Dotfiles

> Modern, modular NixOS configuration with Hyprland for RTX 5060 Laptop

[![NixOS](https://img.shields.io/badge/NixOS-25.11-blue.svg)](https://nixos.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Latest-purple.svg)](https://hyprland.org/)

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [System Specs](#system-specs)
- [Structure](#structure)
- [Installation](#installation)
- [Profiles (Roles)](#profiles-roles)
- [Post-Installation](#post-installation)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

---

## 🎯 Overview

This is a **fully modular NixOS configuration** with Hyprland window manager, optimized for:
- **NVIDIA RTX 5060** Laptop GPU with Wayland support
- Role-based profiles (Development, Gaming, Normal, Study)
- Clean separation of concerns (config, packages, profiles)

## ✨ Features

### 🖥️ Desktop Environment
- **Hyprland** - Modern Wayland compositor with NVIDIA optimizations
- **Waybar** - Beautiful status bar with Catppuccin theme
- **Wofi** - Fast app launcher
- **Mako** - Notification daemon
- **SDDM** - Display manager with Catppuccin theme

### 🎨 Theming
- **Catppuccin Mocha** - Consistent theme across all applications
- **JetBrainsMono Nerd Font** - Programming font with icons

### 🔧 Core Tools
- **Kitty** - GPU-accelerated terminal
- **Zsh + Starship** - Modern shell with beautiful prompt
- **Neovim (AstroNvim)** - Pre-configured Neovim distribution
- **VSCode** - With essential extensions

### 🛠️ Development Stack
- Rust, Go, Java, Node.js/Bun
- Docker with rootless mode
- Git, GitHub CLI, LazyGit
- Full LSP support for all languages

### 🎮 Gaming Support
- Steam with proper configuration
- Gamemode, MangoHud, Lutris
- Wine for Windows games

---

## 💻 System Specs

- **OS**: NixOS 25.11
- **GPU**: NVIDIA RTX 5060 (Laptop)
- **WM**: Hyprland (Wayland)
- **Shell**: Zsh
- **Terminal**: Kitty
- **Audio**: PipeWire (low latency, Discord-optimized)

---

## 📁 Structure

```
~/dotfiles/
├── flake.nix                    # Main flake entry point
├── flake.lock                   # Lock file
│
├── hosts/nixos/                 # Host-specific configs
│   ├── default.nix             # Main host config
│   ├── hardware.nix            # Hardware configuration
│   └── laptop.nix              # Laptop-specific settings
│
├── modules/                     # System modules
│   ├── core/                   # Core system (boot, networking, nix)
│   ├── hardware/               # Hardware (nvidia, audio, bluetooth, power)
│   ├── desktop/                # Desktop (hyprland, sddm, xdg)
│   ├── services/               # Services (docker, ssh)
│   └── users/                  # User definitions
│
├── profiles/                    # Role-based profiles
│   ├── base.nix                # Base profile (always included)
│   ├── development-role.nix    # Development tools
│   ├── gaming-role.nix         # Gaming setup
│   ├── normalmode-role.nix     # Everyday computing
│   └── study-role.nix          # Study tools (PDF, note-taking)
│
├── home/dx07844/               # Home Manager config
│   ├── default.nix             # Main home config
│   ├── config/                 # Application configs
│   │   ├── git/               # Git configuration
│   │   ├── fonts/             # Font configuration
│   │   ├── terminal/          # Kitty config
│   │   ├── shell/             # Zsh config
│   │   ├── editors/           # Neovim & VSCode
│   │   ├── hyprland/          # Hyprland config
│   │   ├── waybar/            # Waybar config
│   │   ├── wofi/              # Wofi config
│   │   ├── mako/              # Mako config
│   │   └── services/          # User services
│   └── packages/               # Package categories
│       ├── browsers/          # Brave, Firefox
│       ├── development/       # Dev tools
│       ├── media/             # Spotify, MPV
│       ├── productivity/      # Discord, Thunar
│       ├── streaming/         # OBS, recording tools
│       └── others/            # Misc packages
│
└── scripts/                     # Utility scripts
    ├── deploy.sh               # Deploy config
    ├── update.sh               # Update system
    └── backup.sh               # Backup config
```

---

## 🚀 Installation

### ⚠️ CRITICAL: Before You Start

**This config is NOT ready to deploy on a fresh NixOS install!**

👉 **You MUST read [DEPLOYMENT.md](DEPLOYMENT.md) first!**

Key requirements:
1. **Enable flakes** in `/etc/nixos/configuration.nix`
2. **Generate your actual hardware config** (current one is a placeholder)
3. **Install Git** on your system

📖 **Step-by-step guide:** [DEPLOYMENT.md](DEPLOYMENT.md)

---

### Quick Overview (After Prerequisites)

### Prerequisites
1. **Fresh NixOS installation** (minimal or graphical)
2. **Internet connection**
3. **Git installed**

### Step 1: Generate Hardware Config

```bash
sudo nixos-generate-config --show-hardware-config > /tmp/hardware-configuration.nix
```

Copy the relevant parts to `hosts/nixos/hardware.nix` (filesystems, boot modules, etc.)

### Step 2: Clone Repository

```bash
# Clone to your preferred location
git clone https://github.com/dx07844/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Step 3: Update Hardware Configuration

Edit `hosts/nixos/hardware.nix` and add your actual hardware configuration from Step 1.

**Important sections to update:**
- `boot.initrd.availableKernelModules`
- `boot.initrd.kernelModules`
- `fileSystems` (your root, boot partitions)
- Verify `swapDevices` path matches your system

### Step 4: Choose Your Profile(s)

Edit `hosts/nixos/default.nix` and select which profiles to enable:

```nix
imports = [
  # ... other imports ...
  
  # Choose your profiles:
  ../../profiles/development-role.nix  # For development work
  # ../../profiles/gaming-role.nix     # For gaming (uncomment if needed)
  # ../../profiles/normalmode-role.nix # For everyday use
  # ../../profiles/study-role.nix      # For study/research
];
```

**Note**: `base.nix` is automatically included in all profiles.

### Step 5: Build and Deploy

```bash
# Initialize flake
nix flake update

# Test build (doesn't activate)
sudo nixos-rebuild test --flake .#nixos

# Deploy (permanently switch)
sudo nixos-rebuild switch --flake .#nixos
```

### Step 6: Reboot

```bash
sudo reboot
```

After reboot, you should see SDDM login screen with Catppuccin theme.

---

## 🎭 Profiles (Roles)

The configuration uses **role-based profiles** that you can mix and match:

### 📦 Base Profile (`base.nix`)
**Always included** - Essential packages and theming.
- Catppuccin GTK theme
- Polkit authentication
- Basic utilities (htop, btop, neofetch)

### 💻 Development Role (`development-role.nix`)
For programming and software development.

**Includes:**
- Rust (rustc, cargo, clippy)
- Go (gopls)
- Java (JDK 17, Maven, Gradle)
- Node.js 22, Bun, npm, pnpm, yarn
- Docker + Docker Compose
- Git, GitHub CLI, LazyGit
- Build tools (make, cmake, gcc)
- API tools (jq, httpie)
- Direnv

**Enable by:** Adding to `hosts/nixos/default.nix` imports

### 🎮 Gaming Role (`gaming-role.nix`)
For gaming and entertainment.

**Includes:**
- Steam (with proper configuration)
- Gamemode
- MangoHud (performance overlay)
- Lutris (game launcher)
- Wine + Winetricks
- Discord

**Enable by:** Uncommenting in `hosts/nixos/default.nix`

### 🌐 Normal Mode Role (`normalmode-role.nix`)
For everyday computing and browsing.

**Includes:**
- LibreOffice
- VLC, MPV (media players)
- Discord, Slack
- Thunar (file manager)
- Basic productivity tools

**Enable by:** Uncommenting in `hosts/nixos/default.nix`

### 📚 Study Role (`study-role.nix`)
For academic work, research, and note-taking.

**Includes:**
- **PDF Tools**: Okular, Xournalpp, PDFtk
- **Note-taking**: Obsidian, Joplin
- **Reference Management**: Zotero
- **Office**: LibreOffice
- **LaTeX**: TeXLive, TeXMaker
- **E-books**: Calibre, Foliate
- Screen annotation (Gromit-MPX)

**Enable by:** Uncommenting in `hosts/nixos/default.nix`

---

## 🔧 Post-Installation

### 1. Set User Password
```bash
sudo passwd dx07844
```

### 2. Configure Monitors (if needed)
Edit `home/dx07844/config/hyprland/hyprland.nix`:
```nix
monitor = "eDP-1,1920x1080@144,0x0,1";  # Adjust for your display
```

Run `hyprctl monitors` to see your monitor names.

### 3. Generate SSH Keys
```bash
ssh-keygen -t ed25519 -C "hiyoussef077@gmail.com"
```

### 4. Setup Secrets (Optional)
```bash
# Install age
nix-shell -p age

# Generate age key
age-keygen -o ~/.config/age/keys.txt
```

### 5. Update Scripts Permissions
```bash
chmod +x scripts/*.sh
```

---

## 🎨 Customization

### Change Theme
All theming is Catppuccin Mocha. To change:
1. Update `modules/desktop/sddm.nix` for login screen
2. Update `home/dx07844/config/terminal/kitty.nix` for terminal
3. Update `home/dx07844/config/waybar/waybar.nix` for status bar
4. Update `home/dx07844/config/editors/vscode.nix` for VSCode

### Add More Packages
Add to appropriate category:
- **System packages**: `profiles/*.nix` or `modules/core/packages.nix`
- **User packages**: `home/dx07844/packages/*/default.nix`

### Modify Keybindings
Edit `home/dx07844/config/hyprland/hyprland.nix`:
```nix
bind = [
  "$mod, Return, exec, kitty"  # Super + Enter = Terminal
  "$mod, B, exec, brave"       # Super + B = Browser
  # Add your custom bindings here
];
```

---

## 🐛 Troubleshooting

### NVIDIA Issues
If you have graphical glitches:
```bash
# Check NVIDIA driver loaded
lsmod | grep nvidia

# Check Hyprland logs
journalctl -b -u display-manager
```

Edit `modules/hardware/nvidia.nix` to adjust settings.

### Audio Not Working
```bash
# Check PipeWire status
systemctl --user status pipewire

# Restart PipeWire
systemctl --user restart pipewire
```

### Hyprland Won't Start
```bash
# Check logs
cat ~/.cache/hyprland/hyprland.log

# Try from TTY
Hyprland
```

### Build Errors
```bash
# Update flake inputs
nix flake update

# Check for syntax errors
nix flake check

# Clean build cache
sudo nix-collect-garbage -d
```

---

## 📚 Useful Commands

### System Management
```bash
# Rebuild config
sudo nixos-rebuild switch --flake .#nixos

# Update system
./scripts/update.sh

# Backup config
./scripts/backup.sh

# List generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback to previous generation
sudo nixos-rebuild switch --rollback
```

### Flake Management
```bash
# Update all inputs
nix flake update

# Update specific input
nix flake lock --update-input nixpkgs

# Show flake info
nix flake show

# Check flake
nix flake check
```

### Hyprland
```bash
# Reload Hyprland
hyprctl reload

# List monitors
hyprctl monitors

# List workspaces
hyprctl workspaces

# Exit Hyprland
hyprctl dispatch exit
```

---

## 📝 Configuration Files

| Component | Config Location |
|-----------|----------------|
| Git | `home/dx07844/config/git/` |
| Fonts | `home/dx07844/config/fonts/` |
| Kitty | `home/dx07844/config/terminal/kitty.nix` |
| Zsh | `home/dx07844/config/shell/zsh.nix` |
| Neovim | `home/dx07844/config/editors/neovim.nix` |
| VSCode | `home/dx07844/config/editors/vscode.nix` |
| Hyprland | `home/dx07844/config/hyprland/` |
| Waybar | `home/dx07844/config/waybar/` |

---

## 🤝 Contributing

Feel free to fork and customize for your own needs!

---

## 📄 License

MIT License - Do whatever you want with it!

---

## 🙏 Credits

- [NixOS](https://nixos.org/)
- [Hyprland](https://hyprland.org/)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Catppuccin](https://github.com/catppuccin/catppuccin)
- [AstroNvim](https://astronvim.com/)

---

## 📧 Contact

**dx07844**
- Email: hiyoussef077@gmail.com
- GitHub: [@dx07844](https://github.com/dx07844)

---

**Happy Hacking! 🚀** 