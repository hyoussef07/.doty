{ config, pkgs, ... }:

{
  # Base profile - Essential packages for all roles
  
  # Desktop environment packages and settings
  environment.systemPackages = with pkgs; [
    # Themes
    catppuccin-gtk
    catppuccin-cursors.mochaDark
    papirus-icon-theme
    
    # Essential utilities
    polkit_gnome
    
    # Basic tools (always needed)
    htop
    btop
    neofetch
  ];

  # GTK theme
  programs.dconf.enable = true;
  
  # Polkit authentication agent
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
