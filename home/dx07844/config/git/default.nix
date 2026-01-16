{ config, pkgs, ... }:

{
  # Git configuration
  programs.git = {
    enable = true;
    userName = "dx07844";
    userEmail = "hiyoussef077@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
