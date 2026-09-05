{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  environment.systemPackages = with pkgs; [
    kitty           # terminal
    wl-clipboard    # clipboard
    brightnessctl   # brightness keys
    pamixer         # volume control
    waybar          # status bar
    pywal           # status bar colour helper
    wofi            # app launcher
    hyprpaper       # wallpaper
    hyprpicker
    firefox         # browser
    amberol         # music player


  ];
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };
}

