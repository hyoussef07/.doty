{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
    ./laptop.nix
    
    # Core modules
    ../../modules/core/boot.nix
    ../../modules/core/networking.nix
    ../../modules/core/security.nix
    ../../modules/core/nix.nix
    ../../modules/core/packages.nix
    
    # Hardware modules
    ../../modules/hardware/nvidia.nix
    ../../modules/hardware/audio.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/power.nix
    ../../modules/hardware/display.nix
    
    # Desktop
    ../../modules/desktop/hyprland
    ../../modules/desktop/sddm.nix
    ../../modules/desktop/xdg.nix
    
    # Services
    ../../modules/services/docker.nix
    ../../modules/services/ssh.nix
    
    # Users
    ../../modules/users/dx07844.nix
    
  # Profiles (Choose which roles you want)
  ../../profiles/development-role.nix   # Development tools
  # ../../profiles/gaming-role.nix      # Gaming (uncomment if needed)
  # ../../profiles/normalmode-role.nix  # Everyday computing
  # ../../profiles/study-role.nix       # Study/Research tools
  networking.hostName = "nixos";

  # Time zone and locale (from your important notes)
  time.timeZone = "Africa/Tunis";
  i18n.defaultLocale = "en_US.UTF-8";

  # System version
  system.stateVersion = "25.11";
}
