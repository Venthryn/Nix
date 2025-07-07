{
  description = "Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, stylix, ... }@inputs:
    let inherit (nixpkgs) lib;
    in {
      nixosConfigurations = {
        Laptop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./nixos/systems/laptop/configuration.nix ];
          specialArgs = { inherit inputs; };
        };
        Desktop = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./nixos/systems/desktop/configuration.nix ];
          specialArgs = { inherit inputs; };
        };
        Server = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./nixos/systems/server/configuration.nix ];
        };
      };

      homeConfigurations = {
        "Venthryn" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          modules = [ ./home-manager/home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}

