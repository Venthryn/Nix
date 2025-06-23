{ pkgs, ... }:

{

  # Services and programs
  services.dunst.enable = true;
  programs.swaylock.enable = true;
  services.clipman.enable = true;

  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "swaylock -f -c 000000";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "swaylock -f -c 000000";
      }
    ];
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
      };
    };
  };

  programs.kitty.enable = true;

  # Rofi launcher (Meta → type to search)
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  # Hyprland config + theming
  xdg.configFile = {
    # Hyprland config pieces
    "hypr/monitors.conf".text = ''
      monitor=,preferred,auto,1
    '';

    "hypr/input.conf".text = ''
      input {
        natural_scroll = true
      }
    '';

    "hypr/keybinds.conf".text = ''
      # Firefox: Meta+F
      bind = SUPER, F, exec, firefox

      # App launcher (Meta then type)
      bind = SUPER, RETURN, exec, rofi -show drun

      # Vim-style window movement (Ctrl+W then HJKL)
      bind = CTRL SHIFT, H, movefocus, l
      bind = CTRL SHIFT, L, movefocus, r
      bind = CTRL SHIFT, K, movefocus, u
      bind = CTRL SHIFT, J, movefocus, d
    '';

    "hypr/exec-once.conf".text = ''
      exec-once = dunst &
      exec-once = waybar &
      exec-once = wl-paste --watch clipman store &
      exec-once = swayidle &
    '';

    # Catppuccin Mocha Theme: Waybar
    "waybar/style.css".text = ''
      @define-color base   #1e1e2e;
      @define-color mantle #181825;
      @define-color crust  #11111b;

      @define-color text     #cdd6f4;
      @define-color subtext0 #a6adc8;
      @define-color surface0 #313244;
      @define-color surface1 #45475a;

      @define-color blue      #89b4fa;
      @define-color lavender  #b4befe;
      @define-color sapphire  #74c7ec;
      @define-color green     #a6e3a1;
      @define-color yellow    #f9e2af;
      @define-color peach     #fab387;
      @define-color red       #f38ba8;
      @define-color pink      #f5c2e7;
      @define-color flamingo  #f2cdcd;
      @define-color mauve     #cba6f7;

      * {
        font-family: JetBrainsMono Nerd Font, monospace;
        font-size: 13px;
        background: transparent;
        color: @text;
      }

      window#waybar {
        background-color: @base;
        border-bottom: 2px solid @surface0;
      }

      #workspaces button.focused {
        background-color: @lavender;
        color: @crust;
      }

      #clock,
      #battery,
      #pulseaudio,
      #network,
      #tray {
        padding: 0 10px;
      }
    '';

    # Catppuccin Mocha Theme: Dunst
    "dunst/dunstrc".text = ''
      [global]
      frame_color = "#89b4fa"
      separator_color = frame
      background = "#1e1e2e"
      foreground = "#cdd6f4"
      font = Monospace 10
      corner_radius = 6

      [urgency_low]
      timeout = 3
      background = "#1e1e2e"
      foreground = "#a6adc8"
      frame_color = "#313244"

      [urgency_normal]
      timeout = 6
      background = "#1e1e2e"
      foreground = "#cdd6f4"
      frame_color = "#89b4fa"

      [urgency_critical]
      timeout = 0
      background = "#1e1e2e"
      foreground = "#f38ba8"
      frame_color = "#f38ba8"
    '';

    # Catppuccin Mocha Theme: Kitty
    "kitty/kitty.conf".text = ''
      background #1e1e2e
      foreground #cdd6f4
      selection_background #585b70
      selection_foreground #cdd6f4
      url_color #f5c2e7
      cursor #f5c2e7

      # normal colors
      color0 #45475a
      color1 #f38ba8
      color2 #a6e3a1
      color3 #f9e2af
      color4 #89b4fa
      color5 #f5c2e7
      color6 #94e2d5
      color7 #bac2de

      # bright colors
      color8  #585b70
      color9  #f38ba8
      color10 #a6e3a1
      color11 #f9e2af
      color12 #89b4fa
      color13 #f5c2e7
      color14 #94e2d5
      color15 #a6adc8

      font_family JetBrainsMono Nerd Font
      font_size 11
    '';
  };
}

