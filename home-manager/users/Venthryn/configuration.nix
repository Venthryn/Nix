{
  imports = [
    ../../../modules/home-manager/shell.nix
    ../../../modules/home-manager/kitty.nix
    ../../../modules/home-manager/vim.nix
    ../../../modules/home-manager/stylix.nix
    ../../../modules/home-manager/hyprland
  ];


  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
