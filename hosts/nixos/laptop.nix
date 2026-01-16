{ config, pkgs, ... }:

{
  # Laptop-specific configurations
  
  # Power management
  services.thermald.enable = true;
  
  # Laptop tools
  environment.systemPackages = with pkgs; [
    powertop
    acpi
  ];

  # Enable touchpad support
  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      disableWhileTyping = true;
    };
  };

  # Better laptop experience
  programs.light.enable = true; # Backlight control
}
