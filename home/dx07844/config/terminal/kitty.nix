{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    
    theme = "Catppuccin-Mocha";
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    settings = {
      # Window
      window_padding_width = 8;
      background_opacity = "0.95";
      
      # Cursor
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      
      # Scrollback
      scrollback_lines = 10000;
      
      # Bell
      enable_audio_bell = false;
      
      # Performance
      repaint_delay = 10;
      input_delay = 3;
      sync_to_monitor = true;
      
      # Tab bar
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };

    # Keybindings
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+w" = "close_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
    };
  };
}
