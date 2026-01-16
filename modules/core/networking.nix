{ config, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    
    # Firewall
    firewall = {
      enable = true;
      # allowedTCPPorts = [ ];
      # allowedUDPPorts = [ ];
    };
  };

  # Enable systemd-resolved for DNS
  services.resolved.enable = true;
}
