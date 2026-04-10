{ config, pkgs, ... }:

{
  users.users.anko = {
    isNormalUser = true;
    description = "anko";
    extraGroups = [ "networkmanager" "wheel" "docker" ];

    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
