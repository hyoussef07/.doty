{ config, pkgs, ... }:

{
  # Security settings
  security = {
    polkit.enable = true;
    rtkit.enable = true; # For PipeWire
    
    # Sudo settings
    sudo = {
      enable = true;
      wheelNeedsPassword = true;
    };
  };

  # Enable doas as alternative to sudo (optional)
  # security.doas.enable = true;
}
