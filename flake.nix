{
  description = "Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    nvimConfig.url = "git+ssh://git@github.com/venthryn/vim";



    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, stylix, plasma-manager, nvimConfig, ... }@inputs:
    let inherit (nixpkgs) lib;
    in {
      nixosConfigurations = {
        Laptop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./nixos/systems/Laptop/configuration.nix ];
          specialArgs = { inherit inputs; };
        };
        Desktop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./nixos/systems/Desktop/configuration.nix ];
          specialArgs = { inherit inputs; };
        };
        Server = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./nixos/systems/Server/configuration.nix ];
        };
      };

      homeConfigurations = {
        "Venthryn" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          modules = [ ./home-manager/users/Venthryn/configuration.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}

