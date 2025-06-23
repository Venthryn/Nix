{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    kitty           # terminal
    waybar          # status bar
    rofi-wayland    # launcher
    dunst           # notifications
    swaylock        # lock screen
    swayidle        # idle manager
    grim slurp      # screenshot
    wl-clipboard    # clipboard
    brightnessctl   # brightness keys
    pamixer         # volume control
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  security.pam.services.swaylock = {};  # needed for swaylock to work
}

