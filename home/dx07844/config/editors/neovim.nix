{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Install AstroNvim dependencies
    extraPackages = with pkgs; [
      # LSP
      nil # Nix
      rust-analyzer
      gopls
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      jdt-language-server # Java
      
      # Formatters
      nixpkgs-fmt
      rustfmt
      gofmt
      nodePackages.prettier
      
      # Tools
      ripgrep
      fd
      tree-sitter
      lazygit
    ];
  };

  # Install AstroNvim
  home.file.".config/nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "AstroNvim";
      rev = "v4.7.7";
      sha256 = "sha256-czl8RiOr07ynz9/sq2/rGPB1bFVRCr+jMRpXF/oPNqM=";
    };
    recursive = true;
  };
}
