{ config, pkgs,inputs, ... }:

{
  imports = [
    ./../../home-manager/shared.nix
    ./../../home-manager/programs/zen.nix
    ./../../home-manager/programs/shell.nix
    ./../../home-manager/programs/pdf-viewer.nix
    ./../../home-manager/window-manager.nix
  ];

	
  # Desktop-specific Home Manager packages
  home.packages = with pkgs; [
    discord
    spotify
  ];
wayland.windowManager.hyprland.settings = {
  monitor = [
    "eDP-1, 2256x1504@60, 0x0, 1"   # your laptop panel — adjust scale to taste
    ", preferred, auto, 1"             # catch-all: any other monitor gets its preferred res, auto-placed, scale 1
  ];
};
}
