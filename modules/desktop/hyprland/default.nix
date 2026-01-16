{ config, pkgs, inputs, ... }:

{
  imports = [
    ./nvidia.nix
  ];

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  # XDG Desktop Portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  # Hyprland environment variables
  environment.sessionVariables = {
    # Tell electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };

  # Essential packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Wayland stuff
    wayland
    wayland-protocols
    wayland-utils
    
    # xdg-utils
    xdg-utils
    
    # Screenshot tools
    grim
    slurp
    grimblast
    
    # Clipboard
    wl-clipboard
    cliphist
    
    # App launcher
    wofi
    
    # Status bar
    waybar
    
    # Notifications
    mako
    libnotify
    
    # Wallpaper
    swaybg
    hyprpaper
    
    # Utilities
    wlr-randr
    wtype
  ];
}
