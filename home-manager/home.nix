
let
  shellModule = import ../modules/home-manager/shell.nix;
  vimModule = import ../modules/home-manager/vim/vim.nix;
  programsModule = import ../modules/home-manager/programs.nix;
  kittyModule = import ../modules/home-manager/kitty.nix;
  ewwModule = import ../modules/home-manager/eww;
  jetbrainsModule = import ../modules/home-manager/jetbrains.nix;
  plasmaModule = import ../modules/home-manager/plasma.nix;
in {
  imports = [
    shellModule
    programsModule
    vimModule
    kittyModule
    ewwModule
    jetbrainsModule
    plasmaModule
  ];

  home.username = "Venthryn";
  home.homeDirectory = "/home/Venthryn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
