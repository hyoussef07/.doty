{ config, pkgs, ... }:

{
  # Power management for laptops
  services.power-profiles-daemon.enable = false; # Conflicts with TLP
  
  services.tlp = {
    enable = true;
    settings = {
      # Battery
      START_CHARGE_THRESH_BAT0 = 20;
      STOP_CHARGE_THRESH_BAT0 = 80;
      
      # CPU scaling
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      
      # CPU boost
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      
      # Runtime power management
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";
    };
  };

  # Enable UPower for battery monitoring
  services.upower.enable = true;
}
