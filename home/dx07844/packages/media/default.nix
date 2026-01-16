{ config, pkgs, ... }:

{
  # Media packages
  home.packages = with pkgs; [
    # Music
    spotify
    
    # Video
    mpv
    
    # Images
    imv
    
    # Audio control
    pavucontrol
  ];
}
