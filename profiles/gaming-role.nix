{ config, pkgs, ... }:

{
  # Gaming profile - For gaming and entertainment
  imports = [
    ./base.nix
  ];

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  
  programs.gamemode.enable = true;
  
  environment.systemPackages = with pkgs; [
    # Game launchers
    lutris
    wine
    winetricks
    
    # Performance tools
    mangohud
    gamemode
    
    # Discord for gaming community
    discord
  ];

  # Better gaming performance
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642; # For some games
  };
}
