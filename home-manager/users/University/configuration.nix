{ pkgs, ... }: {

  imports = [
    ../../../modules/home-manager/shell.nix
    ../../../modules/home-manager/kitty.nix
    ../../../modules/home-manager/vim.nix
  ];


  home.username = "University";
  home.homeDirectory = "/home/University";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    zathura
  ];

}
