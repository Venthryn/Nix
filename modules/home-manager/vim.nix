{ pkgs, ... }:

{
  # Formatters: https://helix-editor.vercel.app/reference/formatters
  # Language Servers: https://docs.helix-editor.com/lang-support.html

  programs.helix = {
    enable = true;

    # Editor settings
    settings = {
      theme = "rose_pine";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        line-number = "relative";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = [ "nixd" "nil" ];
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        {
          name = "c";
          auto-format = true;
          language-servers = [ "clangd" ];
          formatter.command = "${pkgs.clang-tools}/bin/clang-format";
        }
      ];
      language-server = {
        nixd = { command = "${pkgs.nixd}/bin/nixd"; };
        clangd = { command = "${pkgs.clang-tools}/bin/clangd"; };
      };
    };
  };
}

