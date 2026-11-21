{ pkgs, ... }: {

  imports = [
    ../../../modules/home-manager/shell.nix
    ../../../modules/home-manager/kitty.nix
    ../../../modules/home-manager/vim.nix
    ../../../modules/home-manager/gnome.nix
  ];


  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";
  };

}
