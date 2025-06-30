{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ quickshell hyprcursor ];

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [ "/home/Venthryn/Pictures/iq9Mq0l.jpeg" ];
      wallpaper = [ ",/home/Venthryn/Pictures/iq9Mq0l.jpeg" ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "kitty";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";
      exec-once = [ "waybar" "hyprpaper" ];
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        allow_tearing = false;
        layout = "dwindle";
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
        sensitivity = 0;
      };
      gestures = { workspace_swipe = true; };
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, $terminal"
        "$mod, C, exec, killactive"
        "$mod, R, exec, $menu"
        "$mod, F, exec, $browser"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

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

}

