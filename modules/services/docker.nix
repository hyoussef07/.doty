{ config, pkgs, ... }:

{
  # Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    
    # Rootless docker (more secure)
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    
    # Auto-prune
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  # Add user to docker group (will be added in user module)
  # users.users.dx07844.extraGroups = [ "docker" ];
}
