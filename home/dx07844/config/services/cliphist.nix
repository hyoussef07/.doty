{ config, pkgs, ... }:

{
  # Clipboard history service
  systemd.user.services.cliphist = {
    Unit = {
      Description = "Clipboard history service";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store";
      Restart = "on-failure";
    };
    
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
