{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/hyprland.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/plasma.nix
    ../../../modules/nixos/bluetooth.nix
    ../../../modules/nixos/nvidia.nix
  ];

  networking.hostName = "Desktop";


}
