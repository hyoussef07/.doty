{ config, pkgs, ... }:

{
  # Development packages
  home.packages = with pkgs; [
    # Code editors (configured separately in config/)
    # vscode and neovim are in config/
    
    # Terminal tools
    yazi # File manager
    
    # Fonts for coding
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "Hack" ]; })
  ];
}
