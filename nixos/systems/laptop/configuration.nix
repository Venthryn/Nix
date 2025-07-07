{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/hyprland.nix
    ../../../modules/nixos/shell.nix
  ];

  networking.hostName = "Laptop";
}
