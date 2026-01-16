{ config, pkgs, ... }:

{
  # Productivity packages
  home.packages = with pkgs; [
    # File managers
    thunar
    
    # Communication
    discord
  ];
}
