{
  programs.git = {
    enable = true;
    userName = "Bailey Vogt";
    userEmail = "s3906263@student.rmit.edu.au";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # ----- GUI ----- #
  programs.kitty.enable = true;
  programs.waybar.enable = true;
  programs.rofi.enable = true;
  programs.firefox.enable = true;

  # ----- CLI ----- #
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.htop.enable = true; 

  # ----- Home Manager ----- #
  programs.home-manager.enable = true;
}
