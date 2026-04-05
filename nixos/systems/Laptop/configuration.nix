{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/gnome.nix
    ../../../modules/nixos/miracle.nix
    ../../../modules/nixos/bluetooth.nix
    ../../../modules/nixos/nvidia.nix
    ../../../modules/nixos/tailscale.nix
  ];

  networking.hostName = "Laptop";

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    amdgpuBusId = "PCI:54:0:0";
    nvidiaBusId = "PCI:14:0:0";
  };

}
