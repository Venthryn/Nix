{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    
    # Editor settings
    settings = {
      theme = "catppuccin_mocha";
      editor.line-number = "relative";

    };
  };
}

