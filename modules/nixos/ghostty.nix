{ pkgs, ... }:

let
  carbonfox = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/EdenEast/nightfox.nvim/4dacd3f0185a2227bdf3b6c0975a8f0bf87cac9a/extra/carbonfox/carbonfox.ghostty";
    hash = "sha256-ZvjfDzoeFmv8m9+gdk9izBQUU8/B2JiT9aCQ78pLkKk=";
  };

  ghosttyConfig = pkgs.writeText "ghostty-config" ''
    theme = ${carbonfox}
    shell-integration = zsh
  '';
in
{
  environment.systemPackages = [ pkgs.ghostty ];
  services.dbus.packages = [ pkgs.ghostty ];
  systemd.packages = [ pkgs.ghostty ];

  environment.etc."ghostty/config".source = ghosttyConfig;

  systemd.user.tmpfiles.rules = [
    "d %h/.config/ghostty 0755 - - -"
    "L+ %h/.config/ghostty/config - - - - /etc/ghostty/config"
  ];
}
