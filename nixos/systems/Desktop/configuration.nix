{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/gnome.nix
    ../../../modules/nixos/bluetooth.nix
    ../../../modules/nixos/nvidia.nix
    ../../../modules/nixos/tailscale.nix
    ../../../modules/nixos/winboat.nix
    ../../../modules/nixos/unreal.nix
  ];


  networking.hostName = "Desktop";

  environment.systemPackages = with pkgs; [
    xfsprogs
  ];

  services.lvm.enable = true;

  fileSystems."/Data" = {
    device = "/dev/disk/by-label/Data";
    fsType = "xfs";
    options = [ "defaults" "nofail" ];
  };

  systemd.tmpfiles.rules = [
    "d /Data 0777 root root - -"
  ];

}
