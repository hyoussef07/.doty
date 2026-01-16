{ config, pkgs, ... }:

{
  # User account
  users.users.dx07844 = {
    isNormalUser = true;
    description = "dx07844";
    extraGroups = [ 
      "wheel"           # Sudo access
      "networkmanager"  # Network management
      "video"           # Video devices
      "audio"           # Audio devices
      "docker"          # Docker
      "input"           # Input devices
    ];
    
    # Set shell
    shell = pkgs.zsh;
  };

  # Enable Zsh system-wide
  programs.zsh.enable = true;
}
