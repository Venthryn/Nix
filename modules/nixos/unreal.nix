{ lib, config, pkgs, ... }:

let
  unrealUsers = [
    "Venthryn"
    "University"
  ];

  # Build the FHS sandbox container package with all required dependencies
  unrealFhs = pkgs.buildFHSEnv {
    name = "unreal-fhs";
    targetPkgs = pkgs: with pkgs; [
      stdenv.cc.cc libGL libx11 libxcursor libxinerama libXcomposite
      libxrandr libxi libxrender libxfixes libXdamage
      libxext libxtst libxcb libxkbcommon fontconfig
      freetype gtk3 dbus nss nspr atk at-spi2-atk pango cairo
      gdk-pixbuf glib zlib icu libxml2 openssl vulkan-loader
      alsa-lib libpulseaudio git cmake python3 libdrm
      libgbm expat udev
    ];
    extraBwrapArgs = [ "--bind" "/opt" "/opt" ];
    runScript = "/opt/UnrealEngine/Engine/Binaries/Linux/UnrealEditor";
  };
in
{
  users.groups.unreal = {};

  users.users = lib.genAttrs unrealUsers (user: {
    extraGroups = lib.mkIf (config.users.users ? ${user}) [ "unreal" ];
  });

  systemd.tmpfiles.rules = [
    # Type  Path                 Mode  User      Group   Age  Argument
    "d      /opt/UnrealEngine     2775  Venthryn  unreal  -    -"
    "Z      /opt/UnrealEngine     -     Venthryn  unreal  -    -"
  ];

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "ue" ''
      exec ${unrealFhs}/bin/unreal-fhs "$@"
    '')

    (makeDesktopItem {
      name = "unreal-engine";
      desktopName = "Unreal Engine";
      exec = "ue";
      icon = "/opt/UnrealEngine/Engine/Content/Splash/EdSplash.png";
      categories = [ "Development" "Game" ];
    })
  ];
}
