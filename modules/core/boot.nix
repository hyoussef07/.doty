{ config, pkgs, ... }:

{
  # Boot configuration from your important notes
  boot.loader = {
    # UEFI settings
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    
    grub = {
      enable = true;
      device = "nodev";  # Use for UEFI systems
      efiSupport = true;
      useOSProber = true;  # Detect other OS
      configurationLimit = 20;  # Keep last 20 generations
      
      # Optional: Theme for GRUB
      # theme = pkgs.nixos-grub2-theme;
    };
  };

  # Latest kernel for better hardware support
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Kernel parameters
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
}
