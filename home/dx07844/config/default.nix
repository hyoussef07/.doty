{ config, pkgs, ... }:

{
  # Import all configuration modules
  imports = [
    ./git
    ./fonts
    ./terminal
    ./shell
    ./editors
    ./hyprland
    ./waybar
    ./wofi
    ./mako
    ./services
  ];
}
