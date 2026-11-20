{ config, pkgs, ... }:
{
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModprobeConfig = ''options kvm_intel nested=1'';

  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    winboat
    docker-compose
    freerdp
  ];

}
