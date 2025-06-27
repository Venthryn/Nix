{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Bailey Vogt";
    userEmail = "s3906263@student.rmit.edu.au";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    playerctl
    tree
  ];

  # ----- GUI ----- #
  programs.kitty.enable = true;
  programs.waybar.enable = true;
  programs.rofi.enable = true;
  programs.firefox.enable = true;
  programs.zathura.enable = true;

  # ----- CLI ----- #
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.htop.enable = true;
  programs.ranger.enable = true;

  # ----- Home Manager ----- #
  programs.home-manager.enable = true;


  # ----- Services ----- #
}
