{ config, pkgs, ... }:

{
  # Streaming and recording packages
  home.packages = with pkgs; [
    # OBS Studio for streaming/recording
    # obs-studio
    
    # Screen recording
    # simplescreenrecorder
    
    # Uncomment when needed
  ];
}
