{

  programs.waybar = {
    enable = true;

    settings = [{

      modules-left = [ "hyprland/workspaces" ];

      modules-center = [ "clock" ];

      modules-right = [ "tray" "pulseaudio" "battery" ];

      battery = { format = " {}%"; };
      pulseaudio = { format = "󰤽 {volume}%"; };

    }];

  };
}
