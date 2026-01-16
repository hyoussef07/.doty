{ config, pkgs, inputs, ... }:

{
  imports = [
    ./config
    ./packages
  ];

  # Home Manager settings
  home = {
    username = "dx07844";
    homeDirectory = "/home/dx07844";
    stateVersion = "25.11";

    # Environment variables
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      TERMINAL = "kitty";
      BROWSER = "brave";
    };
  };

  # Enable home-manager to manage itself
  programs.home-manager.enable = true;

  # XDG user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
