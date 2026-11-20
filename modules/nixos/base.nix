{ config, pkgs, ... }:

{

  # ----- Booting ----- #
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ----- Networking ----- #
  networking.networkmanager = {
    enable = true;
    wifi.powersave = false;
  };
  services.resolved.enable = true;
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714 ; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714 ; to = 1764; } ];

    allowedTCPPorts = [ 7777 ];
    allowedUDPPorts = [ 7777 ];
  };

  # ----- Localization ----- #
  time.timeZone = "Australia/Melbourne";
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # ----- FHS Compatibility ----- #
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  # ----- Directory Environments ----- #
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # ----- printing ----- #
  services.printing.enable = true;


  # Enable drivers for HP printers
  services.printing.drivers = [ pkgs.hplipWithPlugin ];

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # ----- audio ----- #
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # ----- keyboard ----- #
  services.xserver.xkb = {
    layout = "au"; variant = "";
  };

  
  # ----- core packages ----- #
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    neovim
    gcc
  ];

  # ----- Services ----- #
  services.openssh.enable = true;
 
  # ----- Fonts ----- #
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # ----- Users ----- #
  users.users.Venthryn = {
    isNormalUser = true;
    description = "Bailey Vogt";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    initialPassword = "asdf";
  };

  users.users.University = {
    isNormalUser = true;
    description = "University";
    extraGroups = [ "networkmanager" "docker" ];
    initialPassword = "asdf";
  };

  # ----- System ----- #
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.power-profiles-daemon.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 40;
    priority = 100;
  };

  systemd.oomd = {
    enable = true;
    enableRootSlice = true;
    enableSystemSlice = true;
    enableUserSlices = true;
  };

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
    freeSwapThreshold = 5;
    extraArgs = [ "--prefer" "^(UnrealEditor|ollama|firefox|electron)" ];
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.page-cluster" = 0;
    "vm.watermark_scale_factor" = 125;
    "kernel.sysrq" = 1;
  };

  # ----- Version ----- #
  system.stateVersion = "25.05";
}
