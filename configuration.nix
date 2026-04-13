{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/system.nix
    ./modules/hyperlandStuff.nix
    ./modules/desktop.nix
    ./modules/fonts.nix
    ./modules/nvidia.nix
    ./modules/sound.nix
    ./modules/packages.nix
    ./modules/user.nix
  ];
}
