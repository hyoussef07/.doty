{ config, pkgs, ... }:

{
  # Import all package categories
  imports = [
    ./browsers
    ./development
    ./media
    ./productivity
    ./streaming
    ./others
  ];
}
