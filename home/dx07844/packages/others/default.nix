{ config, pkgs, ... }:

{
  # Other miscellaneous packages
  home.packages = with pkgs; [
    # System utilities
    blueman
    networkmanagerapplet
    
    # Fonts
    noto-fonts
    noto-fonts-emoji
    font-awesome
  ];
}
