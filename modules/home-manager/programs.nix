{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "Bailey Vogt";
    userEmail = "s3906263@student.rmit.edu.au";
    extraConfig = { 
      init.defaultBranch = "main"; 
      credential.helper = "store";
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

  home.packages = with pkgs; [ playerctl tree ];

  # ----- GUI ----- #
  programs.wofi.enable = true;
  programs.firefox.enable = true;
  programs.zathura.enable = true;
  programs.obsidian.enable = true;

  # ----- CLI ----- #
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.htop.enable = true;
  programs.ranger.enable = true;

  # ----- Home Manager ----- #
  programs.home-manager.enable = true;
}
