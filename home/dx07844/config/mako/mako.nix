{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    
    # Catppuccin Mocha theme
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
    
    # Settings
    width = 300;
    height = 150;
    margin = "10";
    padding = "15";
    borderSize = 2;
    borderRadius = 8;
    defaultTimeout = 5000;
    
    # Position
    anchor = "top-right";
    
    # Font
    font = "JetBrainsMono Nerd Font 11";
    
    # Grouping
    groupBy = "app-name";
    
    # Icons
    icons = true;
    maxIconSize = 48;
    
    # Urgency levels
    extraConfig = ''
      [urgency=low]
      border-color=#89b4fa
      
      [urgency=normal]
      border-color=#89b4fa
      
      [urgency=high]
      border-color=#f38ba8
      default-timeout=0
    '';
  };
}
