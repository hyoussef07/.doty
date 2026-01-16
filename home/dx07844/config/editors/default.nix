{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./vscode.nix
  ];
}
