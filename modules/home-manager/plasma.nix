{ pkgs, inputs, ... }:
{

  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  home.packages = with pkgs; [ 
    graphite-cursors
    tela-icon-theme
  ];


  programs.plasma = {
    enable = true;
    workspace = {
      cursor.theme = "graphite-dark";
      iconTheme = "Tela";
    };
  };
}
