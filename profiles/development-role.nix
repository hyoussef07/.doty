{ config, pkgs, ... }:

{
  # Development profile - For coding and development work
  imports = [
    ./base.nix
  ];

  # Development tools and languages
  environment.systemPackages = with pkgs; [
    # Rust
    rustc
    cargo
    rustfmt
    clippy
    
    # Go
    go
    gopls
    
    # Java
    jdk17
    maven
    gradle
    
    # Node.js / Bun
    nodejs_22
    bun
    nodePackages.npm
    nodePackages.pnpm
    nodePackages.yarn
    
    # Python (for tooling)
    python3
    
    # Docker tools
    docker-compose
    
    # Build tools
    gnumake
    cmake
    gcc
    pkg-config
    
    # Version control
    git
    gh # GitHub CLI
    lazygit
    
    # API testing & Dev tools
    jq
    yq
    httpie
    difftastic
  ];

  # Enable direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
