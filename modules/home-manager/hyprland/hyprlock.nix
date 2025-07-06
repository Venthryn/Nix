{ lib, config, ... }:
{
  
  programs.hyprlock = {
    enable = true;

    settings = {
      input-field = {
        position = "0, 25%";
        halign = "center";
        valign = "bottom";
        fade_on_empty = false;
        placeholder_text = ". . .";
      };
      label = {
        text = "$TIME";
        font_size = "128";
        position = "0%, 25%";
      };

    };

  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = let
        hyprlock = lib.getExe config.programs.hyprlock.package;
      in [
        "SUPER,l,exec,${hyprlock} --immediate"
        ",XF86LogOff,exec,${hyprlock} --immediate"
      ];
    };
  };
}
