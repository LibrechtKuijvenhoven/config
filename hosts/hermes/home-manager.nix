{ config, pkgs,inputs, ... }:

{
  imports = [
    ./../../home-manager/shared.nix
    ./../../home-manager/programs/zen.nix
    ./../../home-manager/programs/shell.nix
    ./../../home-manager/window-manager.nix
  ];

	
  # Desktop-specific Home Manager packages
  home.packages = with pkgs; [
    discord
    spotify
  ];
}
