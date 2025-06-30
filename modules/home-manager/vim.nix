{ pkgs, ... }:

{
  # Formatters: https://helix-editor.vercel.app/reference/formatters
  # Language Servers: https://docs.helix-editor.com/lang-support.html

  programs.helix = {
    enable = true;
    themes = {
      Terafox = {
        "inherits" = "nightfox";
        palette = {
          "black" = "#4e5157";
          "red" = "#eb746b";
          "red-dim" = "#e85c51";
          "green" = "#8eb2af";
          "green-dim" = "#7aa4a1";
          "yellow" = "#fdb292";
          "yellow-bright" = "#d78b6c";
          "blue" = "#73a3b7";
          "blue-bright" = "#4d7d90";
          "blue-dim" = "#5a93aa";
          "magenta" = "#b97490";
          "magenta-bright" = "#934e69";
          "cyan" = "#afd4de";
          "cyan-bright" = "#89aeb8";
          "cyan-dim" = "#a1cdd8";
          "orange" = "#ff9664";
          "orange-bright" = "#d96f3e";
          "pink" = "#d38d97";
          "pink-bright" = "#ad6771";
          "bg0" = "#0f1c1e";
          "bg1" = "#152528";
          "bg2" = "#1d3337";
          "bg3" = "#254147";
          "bg4" = "#2d4f56";
          "fg0" = "#eaeeee";
          "fg1" = "#e6eaea";
          "fg2" = "#cbd9d8";
          "fg3" = "#587b7b";
          "sel0" = "#293e40";
          "sel1" = "#425e5e";
        };
      };
    };
    settings = {
      theme = "Terafox";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        line-number = "relative";
      };
      keys.normal."space" = {
        "m" = ":sh pandoc % -o /tmp/preview.pdf && zathura /tmp/preview.pdf";
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
        {
          name = "markdown";
          auto-format = true;
          language-servers = [ "marksman" ];
          formatter.command = "${pkgs.prettier}/bin/prettier";
        }
      ];
      language-server = {
        nixd = { command = "${pkgs.nixd}/bin/nixd"; };
        clangd = { command = "${pkgs.clang-tools}/bin/clangd"; };
        marksman = { command = "${pkgs.marksman}/bin/marksman"; };
      };
    };
  };
  home.packages = with pkgs; [ helix pandoc zathura entr ];
}

