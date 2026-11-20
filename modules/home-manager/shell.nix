{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nix-search-cli # Provides Nixpkgs lookup support for pay-respects
    gh             # GitHub CLI
  ];

  # Command correction & Nixpkgs package suggestions
  programs.pay-respects = {
    enable = true;
    enableZshIntegration = true;
  };

  # Terminal UI for Git (run with `lg`)
  programs.lazygit = {
    enable = true;
  };

  # Syntax-highlighted side-by-side Git diffs
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      side-by-side = true;
    };
  };


  # Fuzzy finder (Ctrl+R for command history, Ctrl+T for files)
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Smarter `cd` (`cd project` jumps to frequent folders, `cdi` opens interactive picker)
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      ignoreDups = true;
      ignoreSpace = true; # Prefix a command with a space to omit it from history
    };

    initContent = ''
      autoload -Uz add-zsh-hook
      set_nix_prompt() {
        if [[ -n "$name" && "$name" != "shell" && "$name" != "nix-shell" ]]; then
          RPROMPT="%F{blue}[  $name ]%f"
        else
          RPROMPT=""
        fi
      }
      add-zsh-hook precmd set_nix_prompt
    '';

    shellAliases = {
      ll = "ls -l";
      v = "nvim";
      lg = "lazygit";
      "nix develop" = "nix develop -c zsh";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "mvn"
        "python"
        "sudo"
      ];
      theme = "robbyrussell";
    };
  };
}
