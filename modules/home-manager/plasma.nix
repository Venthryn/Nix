{ pkgs, inputs, ... }:
{

  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  home.packages = with pkgs; [ graphite-cursors ];


  programs.plasma = {
    enable = true;
  };
}
