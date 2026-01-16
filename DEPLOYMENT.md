# ⚠️ BEFORE YOU DEPLOY - CRITICAL STEPS

## 🚨 This Config is NOT Ready to Deploy Yet!

You need to do these steps FIRST on your NixOS machine:

---

## 1️⃣ Enable Flakes on Your System

**On your fresh NixOS install**, you need to enable flakes first.

Edit `/etc/nixos/configuration.nix` and add:

```nix
{ config, pkgs, ... }:

{
  # ... your existing config ...

  # Enable flakes (REQUIRED!)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Install git (REQUIRED to clone this repo)
  environment.systemPackages = with pkgs; [
    git
    vim  # or your preferred editor
  ];

  # ... rest of your config ...
}
```

Then rebuild:
```bash
sudo nixos-rebuild switch
```

---

## 2️⃣ Generate Your Hardware Config

**CRITICAL:** The current `hosts/nixos/hardware.nix` is a PLACEHOLDER!

```bash
# Generate your actual hardware config
sudo nixos-generate-config --show-hardware-config > /tmp/hardware.nix
```

**Copy these sections from `/tmp/hardware.nix` to `hosts/nixos/hardware.nix`:**
- ✅ `boot.initrd.availableKernelModules = [ ... ];`
- ✅ `boot.initrd.kernelModules = [ ... ];`
- ✅ `boot.kernelModules = [ ... ];`
- ✅ `fileSystems."/" = { ... };`
- ✅ `fileSystems."/boot" = { ... };` (or `/boot/efi`)
- ✅ All other filesystems
- ✅ Verify `swapDevices` path (currently set to `/dev/nvme0n1p6`)

**Example of what you need:**
```nix
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/YOUR-ROOT-UUID";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/YOUR-BOOT-UUID";
    fsType = "vfat";
  };

  swapDevices = [ { device = "/dev/nvme0n1p6"; } ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
```

---

## 3️⃣ Verify Your Swap Device

Check your actual swap partition:
```bash
lsblk
# or
sudo fdisk -l
```

Update `swapDevices` in `hosts/nixos/hardware.nix` if needed.

---

## 4️⃣ NOW You Can Clone & Deploy

```bash
# Clone this repo
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles

# Update hardware.nix with YOUR actual config (from step 2)
vim hosts/nixos/hardware.nix

# Initialize flake
nix flake update

# Test build
sudo nixos-rebuild test --flake .#nixos

# If test works, deploy permanently
sudo nixos-rebuild switch --flake .#nixos

# Reboot
sudo reboot
```

---

## 🔍 Quick Checklist Before Deploy

- [ ] Flakes enabled in `/etc/nixos/configuration.nix`
- [ ] Git installed
- [ ] Generated hardware config with `nixos-generate-config`
- [ ] Copied hardware config to `hosts/nixos/hardware.nix`
- [ ] Verified swap device path
- [ ] Verified filesystem UUIDs
- [ ] Chose which profiles to enable in `hosts/nixos/default.nix`
- [ ] Ran `nix flake update`

---

## ⚠️ Common Issues

### "error: experimental Nix feature 'flakes' is disabled"
→ You didn't enable flakes in step 1

### "error: getting status of '/nix/store/...': No such file or directory"
→ Your hardware config is wrong, go back to step 2

### "mount: /boot/efi: special device does not exist"
→ Wrong filesystem UUIDs in hardware.nix

### System won't boot after deploy
→ Boot into previous generation from GRUB menu, fix hardware config

---

**Once these steps are done, you're good to go!** 🚀
