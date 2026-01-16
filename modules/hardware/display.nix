{ config, pkgs, ... }:

{
  # Display configuration
  services.xserver = {
    enable = true;
    
    # X11 keymap
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS for printing (if needed)
  # services.printing.enable = true;
}
