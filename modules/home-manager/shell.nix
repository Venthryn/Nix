{ pkgs, ... }: {

  home.packages = with pkgs; [ pay-respects ];
  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(pay-respects zsh)"
    '';
    shellAliases = {
      ll = "ls -l";
      gs = "git status";
      gl = "git log";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

}
