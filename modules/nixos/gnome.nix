{ pkgs, ... }:

{
  # 1. Enable GNOME and the Display Manager
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # 2. Flatpak & Portal Integration
  # Essential for the "Atomic" app management style
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "gnome";
  };

  # 3. GUI Management Tools
  # These help you manage your "mutable" user space
  environment.systemPackages = with pkgs; [
    gnome-shell-extensions
    gnome-tweaks
    dconf-editor
    amberol
    blackbox-terminal
    firefox
    adwaita-icon-theme # Ensures icons show up in non-GTK apps
    steam-run-free
  ];

  # 4. Sane Defaults via Dconf
  # Sets the "Fresh Experience" for any new user.
  # Venthryn can change these in the settings and it will persist.
  programs.dconf.profiles.user.databases = [{
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        clock-show-weekday = true;
        # Uses the font defined in your base.nix
        font-name = "JetBrainsMono Nerd Font 11";
        document-font-name = "JetBrainsMono Nerd Font 11";
        monospace-font-name = "JetBrainsMono Nerd Font 10";
      };
      "org/gnome/mutter" = {
        edge-tiling = true;
        dynamic-workspaces = true;
        center-new-windows = true;
      };
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing"; # Don't sleep if plugged in
      };
    };
  }];

  # 5. Simplify the DE
  # Removes standard GNOME apps you likely won't use if you prefer Flatpaks
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    geary
    totem
    tali iagno hitori atomix # Games
    decibels
  ];
}
