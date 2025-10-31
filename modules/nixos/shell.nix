{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.variables = {
    EDITOR = "/etc/nvim";
  };


}
