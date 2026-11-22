{
  imports = [
    ./hardware-configuration.nix
    ../../../modules/nixos/base.nix
    ../../../modules/nixos/shell.nix
    ../../../modules/nixos/gnome.nix
    ../../../modules/nixos/bluetooth.nix
    ../../../modules/nixos/nvidia.nix
    ../../../modules/nixos/tailscale.nix
  ];

  networking.hostName = "Laptop";

  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  # Regenerate if GPU offload breaks after an update:
  #   lspci -D | grep -E 'VGA|3D' # then convert hex bus to decimal
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    amdgpuBusId = "PCI:115:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

}
