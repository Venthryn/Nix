
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      syntax on
      set number
      set relativenumber
      set expandtab
      set autoindent
      colorscheme catppuccin-mocha
    '';
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nerdtree
      vim-airline
      catppuccin-vim
    ];
  };
}
