{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    
    extensions = with pkgs.vscode-extensions; [
      # Nix
      jnoortheen.nix-ide
      
      # Rust
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      
      # Go
      golang.go
      
      # Java
      redhat.java
      vscjava.vscode-java-debug
      
      # JavaScript/TypeScript
      dbaeumer.vscode-eslint
      esbenp.prettier-vscode
      
      # Git
      eamodio.gitlens
      
      # Theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      
      # General
      ms-vscode.live-server
      formulahendry.code-runner
    ];

    userSettings = {
      # Editor
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "editor.fontSize" = 13;
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.minimap.enabled" = false;
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "on";
      
      # Theme
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      
      # Terminal
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.fontSize" = 13;
      
      # Files
      "files.autoSave" = "afterDelay";
      "files.autoSaveDelay" = 1000;
      
      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
    };
  };
}
