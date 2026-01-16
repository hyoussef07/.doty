{ config, pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    vim
    wget
    curl
    git
    htop
    btop
    
    # Compression
    unzip
    zip
    p7zip
    
    # Network tools
    nmap
    traceroute
    
    # System info
    neofetch
    lshw
    pciutils
    usbutils
  ];
}
