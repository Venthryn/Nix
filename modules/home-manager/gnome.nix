{ lib, ... }:

with lib.hm.gvariant;

let
  # Path from THIS file to folder with wallpaper. Adjust if dconf.nix lives in a subfolder (e.g. ../. or ../..).
  nixRoot = ../../.;

  wallpaperFile = lib.findFirst builtins.pathExists
    (throw "No wallpaper.png or wallpaper.jpg found in ${toString nixRoot}")
    (map (ext: nixRoot + "/wallpaper.${ext}") [ "png" "jpg" ]);

  wallpaper = "file://${wallpaperFile}";
  melbourne = [
    (mkVariant (mkTuple [
      (mkUint32 2)
      (mkVariant (mkTuple [
        "Melbourne"
        "YMML"
        true
        [ (mkTuple [ (-0.657407357402295) 2.527818527487357 ]) ]
        [ (mkTuple [ (-0.6600253512802865) 2.530145644792211 ]) ]
      ]))
    ]))
  ];
in
{
  dconf.settings = {

    "org/gnome/desktop/interface" = {
      accent-color = "red";
      clock-format = "24h";
      clock-show-weekday = true;
      enable-hot-corners = false;
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3";
      cursor-theme = "graphite-dark";
      cursor-size = 32;
    };

    "org/gnome/desktop/background" = {
      picture-uri = wallpaper;
      picture-uri-dark = wallpaper;
      picture-options = "zoom";
    };

    "org/gnome/desktop/screensaver" = {
      picture-uri = wallpaper;
      picture-options = "zoom";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "au" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.5043478260869565;
    };

    "org/gnome/desktop/datetime".automatic-timezone = true;
    "org/gnome/desktop/session".idle-delay = mkUint32 900;
    "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
    "org/gnome/desktop/sound".theme-name = "__custom";
    "org/gnome/mutter".center-new-windows = true;

    "org/gnome/desktop/search-providers" = {
      sort-order = [ "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/remote-desktop/rdp" = {
      enable = true;
      view-only = false;
      tls-cert = "/home/Venthryn/.local/share/gnome-remote-desktop/certificates/rdp-tls.crt";
      tls-key = "/home/Venthryn/.local/share/gnome-remote-desktop/certificates/rdp-tls.key";
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "System" "Utilities" "Games" "Office" "LibreOffice" "SoundVideo" "Accessories" ];
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = [ "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.gnome.SystemMonitor.desktop" "org.gnome.tweaks.desktop" ];
      name = "X-GNOME-Shell-System.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "org.gnome.Decibels.desktop" "org.gnome.Connections.desktop" "org.gnome.Papers.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" "org.gnome.Music.desktop" ];
      name = "X-GNOME-Shell-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Games" = {
      name = "Games";
      apps = [ "com.play0ad.zeroad.desktop" "org.widelands.Widelands.desktop" "page.kramo.Cartridges.desktop" "com.valvesoftware.Steam.desktop" ];
    };

    "org/gnome/desktop/app-folders/folders/Office" = {
      name = "Office";
      apps = [ "md.obsidian.Obsidian.desktop" "com.github.IsmaelMartinez.teams_for_linux.desktop" "com.usebottles.bottles.desktop" ];
    };

    "org/gnome/desktop/app-folders/folders/LibreOffice" = {
      name = "Office"; # same display name as the folder above — rename one if you like
      apps = [ "org.libreoffice.LibreOffice.math.desktop" "org.libreoffice.LibreOffice.writer.desktop" "org.libreoffice.LibreOffice.impress.desktop" "org.libreoffice.LibreOffice.draw.desktop" "org.libreoffice.LibreOffice.calc.desktop" "org.libreoffice.LibreOffice.base.desktop" "org.libreoffice.LibreOffice.desktop" ];
    };

    "org/gnome/desktop/app-folders/folders/SoundVideo" = {
      name = "Sound & Video";
      apps = [ "io.bassi.Amberol.desktop" "org.gnome.Showtime.desktop" "com.rafaelmardojai.Blanket.desktop" ];
    };

    "org/gnome/desktop/app-folders/folders/Accessories" = {
      name = "Accessories";
      apps = [ "org.gnome.World.Iotas.desktop" "org.gnome.Builder.desktop" "page.kramo.Sly.desktop" "org.gnome.gitlab.somas.Apostrophe.desktop" "io.github.alainm23.planify.desktop" "io.github.mrvladus.List.desktop" ];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "gsconnect@andyholmes.github.io"
        "tilingshell@ferrarodomenico.com"
        "search-light@icedman.github.com"
        "auto-adwaita-colors@celiopy"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
      ];
      favorite-apps = [ "firefox.desktop" "com.raggesilver.BlackBox.desktop" "neovide.desktop" "org.gnome.Calendar.desktop" "org.gnome.TextEditor.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/shell/extensions/gsconnect".enabled = true;
    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect".details-in-lock-screen = true;

    "org/gnome/shell/extensions/search-light" = {
      animation-speed = 100.0;
      blur-background = false;
      blur-brightness = 0.6;
      blur-sigma = 30.0;
      border-radius = 3.5799086757990866;
      entry-font-size = 1;
      monitor-count = 3;
      preferred-monitor = 0;
      scale-height = 0.1;
      scale-width = 0.1;
    };

    "org/gnome/shell/extensions/tilingshell" = {
      edge-tiling-mode = "adaptive";
      enable-autotiling = true;
      enable-blur-selected-tilepreview = true;
      enable-blur-snap-assistant = true;
      enable-screen-edges-windows-suggestions = true;
      enable-snap-assistant-windows-suggestions = true;
      enable-tiling-system-windows-suggestions = true;
      enable-window-border = false;
      window-use-custom-border-color = false;
      show-indicator = false;
      snap-assist-sync-layout = true;
      inner-gaps = mkUint32 8;
      outer-gaps = mkUint32 8;
      quarter-tiling-threshold = mkUint32 40;
      span-window-all-tiles = [ "<Shift><Super>Return" ];
      span-window-left = [ "<Shift><Super>h" ];
      span-window-up = [ "<Shift><Super>j" ];
      span-window-down = [ "<Shift><Super>k" ];
      span-window-right = [ "<Shift><Super>l" ];
      selected-layouts = [ [ "Layout 4" "24915598" ] [ "Layout 4" "Layout 1" ] ];
      layouts-json = "[{\"id\":\"Layout 1\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.22,\"height\":0.5,\"groups\":[1,2]},{\"x\":0,\"y\":0.5,\"width\":0.22,\"height\":0.5,\"groups\":[1,2]},{\"x\":0.22,\"y\":0,\"width\":0.56,\"height\":1,\"groups\":[2,3]},{\"x\":0.78,\"y\":0,\"width\":0.22,\"height\":0.5,\"groups\":[3,4]},{\"x\":0.78,\"y\":0.5,\"width\":0.22,\"height\":0.5,\"groups\":[3,4]}]},{\"id\":\"Layout 2\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.22,\"height\":1,\"groups\":[1]},{\"x\":0.22,\"y\":0,\"width\":0.56,\"height\":1,\"groups\":[1,2]},{\"x\":0.78,\"y\":0,\"width\":0.22,\"height\":1,\"groups\":[2]}]},{\"id\":\"Layout 3\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.33,\"height\":1,\"groups\":[1]},{\"x\":0.33,\"y\":0,\"width\":0.67,\"height\":1,\"groups\":[1]}]},{\"id\":\"Layout 4\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.67,\"height\":1,\"groups\":[1]},{\"x\":0.67,\"y\":0,\"width\":0.33,\"height\":1,\"groups\":[1]}]},{\"id\":\"24915598\",\"tiles\":[{\"x\":0,\"y\":0,\"width\":0.5,\"height\":1,\"groups\":[1]},{\"x\":0.5,\"y\":0,\"width\":0.5000000000000058,\"height\":1,\"groups\":[1]}]}]";
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = melbourne;
    };
    "org/gnome/Weather".locations = melbourne;

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
      view-type = "list";
    };
  };
}
