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
    pkgs = import nixpkgs { inherit system; };
    cliPackages = (import ./modules/packages.nix { inherit pkgs inputs; }).cliPackages;
  in {
    nixosConfigurations.devSystem = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };
    packages.x86_64-linux.cli-packages = pkgs.buildEnv {
      name = "cli-packages";
      paths = import ./modules/packages.nix {
        inherit pkgs;
        config = {};
        inputs = inputs;
      };
    };
  };
}
