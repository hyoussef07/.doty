{ config, pkgs, ... }:

{
  # Font configuration
  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    # Nerd Fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "Hack" ]; })
    
    # System fonts
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    
    # Icon fonts
    font-awesome
  ];
}
