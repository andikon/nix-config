{ config, pkgs, ... }:

{
  users.users.anko = {
    isNormalUser = true;
    description = "anko";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$tM6B6ZHCBXME.qOCTuvrT.$MiiZWiGsP1Z6Wu6oGL9.HDu8bVkCukDWeUWycaNJtZ2";

    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  programs.fish.enable = true;
}
