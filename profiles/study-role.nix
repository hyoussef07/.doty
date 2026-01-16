{ config, pkgs, ... }:

{
  # Study profile - For research, reading, note-taking
  imports = [
    ./base.nix
  ];

  environment.systemPackages = with pkgs; [
    # PDF tools
    okular # Advanced PDF reader
    xournalpp # PDF annotation
    pdftk # PDF manipulation
    
    # Note-taking
    obsidian
    joplin-desktop
    
    # Reference management
    zotero
    
    # Office suite
    libreoffice-fresh
    
    # Screen annotation
    gromit-mpx
    
    # Mind mapping
    # xmind
    
    # LaTeX (for academic writing)
    texlive.combined.scheme-medium
    texmaker
    
    # E-book reader
    calibre
    foliate
  ];
}
