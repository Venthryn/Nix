
{ config, pkgs, ... }:

{
  programs.miracle-wm = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty           # terminal
    wl-clipboard    # clipboard
    brightnessctl   # brightness keys
    pamixer         # volume control
    waybar          # status bar
    pywal           # status bar colour helper
    wofi            # app launcher
    swaybg          # wallpaper
    slurp           # colour picker
    grim            # screenshot
    swaylock-effects# screen locker
    swayidle        # inactivity monitor
    firefox         # browser
    amberol         # music player
  ];

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };
}

