{ config, pkgs, ... }:

{
  # NVIDIA-specific Hyprland environment variables
  environment.sessionVariables = {
    # NVIDIA specific
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    
    # Wayland + NVIDIA
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER = "vulkan";
    
    # XDG
    XDG_SESSION_TYPE = "wayland";
    
    # QT
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    
    # Electron apps
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
}
