{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/plasma.nix
    ../../../modules/nixos/bluetooth.nix
    ../../../modules/nixos/nvidia.nix
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
