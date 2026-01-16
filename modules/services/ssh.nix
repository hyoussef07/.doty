{ config, pkgs, ... }:

{
  # SSH server
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # SSH agent
  programs.ssh.startAgent = true;
}
