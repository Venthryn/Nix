{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/base.nix
    ../modules/nixos/hyprland.nix
  ];


  networking.hostName = "Laptop";
}
