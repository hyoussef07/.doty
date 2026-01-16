{ config, pkgs, ... }:

{
  # Browser packages
  home.packages = with pkgs; [
    brave
    firefox
  ];
}
