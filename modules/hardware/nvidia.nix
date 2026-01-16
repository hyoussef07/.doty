{ config, pkgs, ... }:

{
  # NVIDIA drivers - RTX 5060 Laptop
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Use the latest (open source) driver
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    
    # Enable modesetting (required for Wayland)
    modesetting.enable = true;
    
    # Power management (important for laptops)
    powerManagement = {
      enable = true;
      finegrained = false; # Set to true for hybrid graphics
    };
    
    # Use the open source kernel module
    open = true;
    
    # Enable NVIDIA settings menu
    nvidiaSettings = true;
  };

  # Hardware acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # Environment variables for NVIDIA + Wayland
  environment.sessionVariables = {
    # Required for NVIDIA + Wayland
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    
    # Hardware acceleration
    WLR_NO_HARDWARE_CURSORS = "1";
    
    # Fix flickering
    NIXOS_OZONE_WL = "1";
  };
}
