{
  services.xserver.xrandrHeads = [
    # Center ultrawide monitor (primary)
    {
      output = "DP-2";
      primary = true;
    }
    # Right high refresh-rate (secondary)
    {
      output = "HDMI-A-1";
      position = "right-of DP-2";
    }
    # Left low refresh-rate (tertiary)
    {
      output = "DP-1";
      position = "left-of DP-2";
    }
  ];
}
