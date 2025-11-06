{ pkgs, ... }: {

  home.packages = with pkgs; [ pay-respects ];
  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(pay-respects zsh)"
      if [[ -n "$FLAKE_NAME" ]]; then
        RPROMPT="%F{blue}[ 󱄅 $FLAKE_NAME ]%f"
      fi
    '';
    shellAliases = {
      ll = "ls -l";
      gs = "git status";
      gl = "git log";
      ga = "git add";
      gc = "git commit";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

}
