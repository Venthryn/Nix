{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ hyprcursor matugen cava khal hyprpaper ];
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [ "/home/Venthryn/Nix/modules/home-manager/hyprland/wallpaper.png" ];
      wallpaper = [ ",/home/Venthryn/Nix/modules/home-manager/hyprland/wallpaper.png" ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
      # "MonitorID, Resolution@RefreshRate, Position, Scale"
        "eDP-1, 3072x1920@60, 0x0, 2"
      ];


      "$terminal" = "kitty";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";
      exec-once = [ "hyprpaper" ];
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        allow_tearing = false;
        layout = "dwindle";
        resize_on_border = 1;
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;
      };
      animations = { enabled = "yes"; };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      input = {
        touchpad.natural_scroll = true;
        kb_layout = "au";
        follow_mouse = 1;
        sensitivity = -0.25;
        accel_profile = "flat";
      };
      gesture = "3, horizontal, workspace";
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive"
        "$mod, R, exec, $menu"
        "$mod, F, exec, $browser"
        "$mod, V, togglefloating"
        "$mod, P, pin"
        "$mod, J, togglesplit"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"

      ];
      bindm = [ "$mod, mouse:272, movewindow" ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

      ];
    };
  };

  programs.kitty.enable = true;

  imports = [ inputs.dms.homeModules.dank-material-shell ];

  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
  };

}

