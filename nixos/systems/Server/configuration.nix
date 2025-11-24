{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/tailscale.nix
    ../../../modules/nixos/podman.nix
  ];

  fileSystems."/data" = {
    device = "UUID=fad3d010-ddc3-446a-8002-16e3e5e54cfc";
    fsType = "ext4";
    options = [ "nofail" "x-systemd.device-timeout=1s" ];
  };

  networking.hostName = "Europa";

}
