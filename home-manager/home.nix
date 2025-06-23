{ config, pkgs, ... }:

let
  shellModule = import ../modules/home-manager/shell.nix;
  vimModule = import ../modules/home-manager/vim.nix;
  hyprModule = import ../modules/home-manager/hyprland.nix;
  programsModule = import ../modules/home-manager/programs.nix;
in
{
  imports = [ shellModule programsModule vimModule hyprModule ];

  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
