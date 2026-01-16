{ config, pkgs, ... }:

{
  # Virtualization (QEMU/KVM)
  virtualisation.libvirtd = {
    enable = false; # Set to true if you need VMs
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
    };
  };

  # Virt-manager
  # programs.virt-manager.enable = true;
}
