{ config, pkgs, ... }:

{
  # Normal mode - Everyday computing (browsing, media, basic tasks)
  imports = [
    ./base.nix
  ];

  environment.systemPackages = with pkgs; [
    # Basic productivity
    libreoffice-fresh
    
    # Media
    vlc
    mpv
    
    # Communication
    discord
    slack
    
    # File management
    thunar
    
    # Utilities
    flameshot # Screenshots
    calculator
  ];
}
