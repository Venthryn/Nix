{ pkgs, ... }: {

  home.packages = with pkgs; [ pay-respects ];
  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(pay-respects zsh)"
      autoload -Uz add-zsh-hook
      set_nix_prompt() {
        if [[ -n "$name" && "$name" != "shell" ]]; then
          RPROMPT="%F{blue}[    $name ]%f"
        else
          RPROMPT=""
        fi
      }
      add-zsh-hook precmd set_nix_prompt
    '';
    shellAliases = {
      ll = "ls -l";
      gs = "git status";
      gl = "git log";
      ga = "git add";
      gc = "git commit";
      "nix develop" = "nix develop -c zsh";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
