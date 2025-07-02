{ pkgs, ... }:

{


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [

      # colorscheme
      {
      	plugin = nightfox-nvim;
        config = '' 
          color terafox 
        '';
      }

      # gui
      {
      	plugin = lualine-nvim;
        type = "lua";
        config = ''
            require('lualine').setup {
              options = {
                component_separators = { left = "", right = "" },
                section_separators = { left = '', right = '' },
              },
              sections = {
                lualine_a = { 
            { 'mode', 
              separator = { left = '' }, 
              right_padding = 2 } 
          },
          lualine_b = { 'filename', 'branch' },
          lualine_c = { '%=' },
          lualine_x = {},
          lualine_y = { 'filetype', 'progress' },
                lualine_z = { 
            { 'location', 
              separator = { right = '' }, 
              left_padding = 2 } 
          },
              }
            }
        '';
      }
      nvim-web-devicons
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          require("nvim-tree").setup()
        '';
      }
      which-key-nvim

      # Controls
      nvim-cmp
      better-escape-nvim
      commentary

      # Code QOL / LSP
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      vim-markdown
      vimtex
      ultisnips

      # git
      fugitive
    ];
    extraLuaConfig = '' 
      -- Settings

      -- Show abs line number on current line and
      -- relative number everywhere else.
      vim.o.number = true
      vim.o.relativenumber = true
      
      -- Set tabs to spaces with a width of 2.
      vim.o.expandtab = true
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2

      -- Keybinds

      -- Maintain selection when shifting blocks
      vim.keymap.set("x", ">", ">gv")
      vim.keymap.set("x", "<", "<gv")

    '';
  };

}

