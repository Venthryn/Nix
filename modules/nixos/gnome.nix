{ pkgs, lib, ... }:

{
  # 1. Enable GNOME and the Display Manager
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # 2. Flatpak & Portal Integration
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "gnome";
  };

  # 3. Shared GUI Management Tools (available to both users)
  environment.systemPackages = with pkgs; [
    # Gnome configuration
    gnome-shell-extensions
    gnome-tweaks
    dconf-editor
    # Terminal
    blackbox-terminal
    # Theming
    adwaita-icon-theme
    graphite-cursors
  ];

  # 4. Sane Defaults via Dconf (UI & document fonts left at GNOME defaults)
  programs.dconf.profiles.user.databases = [{
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        clock-show-weekday = true;
        cursor-theme = "graphite-dark";
      };
      "org/gnome/mutter" = {
        edge-tiling = true;
        dynamic-workspaces = true;
        center-new-windows = true;
      };
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
      };
    };
  }];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    geary
    totem
    tali iagno hitori atomix
    decibels
    gnome-console
  ];
}
