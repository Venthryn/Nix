{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    nil
    pyright
    marksman
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [

      # colorscheme
      nightfox-nvim

      # gui
      lualine-nvim
      nvim-web-devicons
      nvim-tree-lua
      which-key-nvim

      # Controls
      nvim-cmp
      better-escape-nvim
      commentary

      # Code QOL / LSP
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim
      cmp-nvim-lsp
      nvim-cmp
      luasnip
      cmp_luasnip
      trouble-nvim
      vim-markdown
      vimtex
      ultisnips

      # git
      fugitive
    ];

    extraLuaConfig = '' 
      -- Settings

      -- Theme
      vim.cmd("colorscheme terafox")

      -- Show abs line number on current line and
      -- relative number everywhere else.
      vim.o.number = true
      vim.o.relativenumber = true
      
      -- Set tabs to spaces with a width of 2.
      vim.o.expandtab = true
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2

      dofile("/home/Venthryn/Nix/modules/home-manager/vim/keymaps.lua")
      dofile("/home/Venthryn/Nix/modules/home-manager/vim/lsp.lua")

      local plugin_config_path = "/home/Venthryn/Nix/modules/home-manager/vim/plugins/"
      local scan = vim.loop.fs_scandir(plugin_config_path)
      if scan then
        while true do
          local name, type = vim.loop.fs_scandir_next(scan)
          if not name then break end
          if type == "file" and name:sub(-4) == ".lua" then
            local full_path = plugin_config_path .. "/" .. name
            dofile(full_path)
          end
        end
      end

    '';
  };

}

