{
  imports = [
    ../../../modules/home-manager/shell.nix
    ../../../modules/home-manager/vim/vim.nix
    ../../../modules/home-manager/programs.nix
    ../../../modules/home-manager/kitty.nix
    ../../../modules/home-manager/plasma.nix
  ];

  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

}
