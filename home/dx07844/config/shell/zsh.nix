{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # NixOS
      nrs = "sudo nixos-rebuild switch --flake .#nixos";
      nrt = "sudo nixos-rebuild test --flake .#nixos";
      nrb = "sudo nixos-rebuild boot --flake .#nixos";
      
      # Common
      ll = "ls -lah";
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      
      # Navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      
      # Git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph";
      
      # Development
      dc = "docker-compose";
      dps = "docker ps";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
    };

    initExtra = ''
      # Vi mode
      bindkey -v
      export KEYTIMEOUT=1

      # History search
      bindkey '^R' history-incremental-search-backward
    '';
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = "$all";
      
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
