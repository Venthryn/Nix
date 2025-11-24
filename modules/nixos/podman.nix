{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    podman-tui
    podman-compose
  ];



  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
