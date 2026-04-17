{
  description = "system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system; 
      config = { 
        allowUnfree = true; 
      }; 
    };

    packagesHelper = import ./modules/packages.nix { inherit pkgs inputs; };
  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix packagesHelper.module ];
    };

    packages.${system} = {
      cli-packages = pkgs.buildEnv {
        name = "my-cli-tools";
        paths = packagesHelper.cliPackages;
      };
      
      default = self.packages.${system}.cli-packages;
    };
  };
}
