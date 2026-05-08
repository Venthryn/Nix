{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/gnome.nix
    ../../../modules/nixos/bluetooth.nix
    ../../../modules/nixos/tailscale.nix
  ];


  networking.hostName = "Tablet";

  services.iptsd.enable = true;
  hardware.sensor.iio.enable = true;


}
