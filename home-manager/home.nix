{ config, pkgs, ... }:

let
  shellModule = import ../modules/home-manager/shell.nix;
  programsModule = import ../modules/home-manager/programs.nix;
in
{
  imports = [ shellModule programsModule ];

  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
