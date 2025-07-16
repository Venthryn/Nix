{ config, pkgs, ... }:

let
  shellModule = import ../modules/home-manager/shell.nix;
  vimModule = import ../modules/home-manager/vim/vim.nix;
  hyprModule = import ../modules/home-manager/hyprland;
  programsModule = import ../modules/home-manager/programs.nix;
  stylixModule = import ../modules/home-manager/stylix.nix;
  kittyModule = import ../modules/home-manager/kitty.nix;
  ewwModule = import ../modules/home-manager/eww;
  jetbrainsModule = import ../modules/home-manager/jetbrains.nix;
in {
  imports = [
    shellModule
    programsModule
    vimModule
    hyprModule
    stylixModule
    kittyModule
    ewwModule
    jetbrainsModule
  ];

  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
