{ config, pkgs, lib, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Important for screen sharing, file dialogs, etc.
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # Core services needed
  services.dbus.enable = true;
  security.polkit.enable = true;

  # Audio (safe alongside KDE)
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    wireplumber.enable = true;
  };

  # Optional but usually already enabled
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Hyprland ecosystem + Wayland tools
  environment.systemPackages = with pkgs; [
    # Hyprland ecosystem
    hyprpaper
    hypridle
    hyprlock

    waybar
    wofi
    swaynotificationcenter

    blueman
    networkmanagerapplet

    # Clipboard
    wl-clipboard
    cliphist

    # Screenshots
    grim
    slurp
    swappy

    # Audio control
    pavucontrol

    # Misc utilities
    brightnessctl
    playerctl
    pamixer

    # Fonts (important for waybar/icons)


    # Debugging Wayland issues
    wayland-utils
  ];

  # Environment variables (fix common Wayland issues)
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Chromium/Electron Wayland support
    MOZ_ENABLE_WAYLAND = "1"; # Firefox Wayland
  };

  # GTK theming (so apps don't look broken)
  programs.dconf.enable = true;

  # Optional: better cursor + theme consistency
  environment.variables = {
    XCURSOR_SIZE = "24";
  };

  # Ensure fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
}
