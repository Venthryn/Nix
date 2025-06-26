{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    
    # Editor settings
    settings = {
      editor.line-number = "relative";

    };
  };
}

