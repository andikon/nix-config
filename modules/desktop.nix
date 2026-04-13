{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;


  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "de_se_fi";

  services.printing.enable = true;

}
