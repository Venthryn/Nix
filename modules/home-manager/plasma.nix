{ pkgs, inputs, ... }:

let
  catppuccinKdeMocha = pkgs.catppuccin-kde.override {
    flavour = [ "mocha" ];
    accents = [ "red" ];
    winDecStyles = [ "classic" ];
  };

in {

  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  home.packages = with pkgs; [ 
    graphite-cursors
    tela-icon-theme
    catppuccinKdeMocha
  ];


  programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      lookAndFeel = "Catppuccin-Mocha-Red";
      colorScheme = "catppuccinMochaRed";
      cursor.theme = "graphite-dark";
      iconTheme = "Tela";
    };
  };
}
