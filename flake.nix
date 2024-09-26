{
  description = "Nixos Flake for my selfhosted services";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      examplehost = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/examplehost/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixuser = import ./hosts/examplehost/home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable;
            };
          }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
      rustdesk = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/rustdesk/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixuser = import ./hosts/rustdesk/home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable;
            };
          }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
      nextcloud = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/nextcloud/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixuser = import ./hosts/nextcloud/home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable;
            };
          }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
      keycloak = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/keycloak/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixuser = import ./hosts/keycloak/home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable;
            };
          }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
      jana = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/jana/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nixuser = import ./hosts/jana/home.nix;
            home-manager.extraSpecialArgs = {
              inherit pkgs-unstable;
            };
          }
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
