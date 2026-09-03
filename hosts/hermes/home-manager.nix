{ config, pkgs,inputs, ... }:

{
  imports = [
    ./../../home-manager/shared.nix
    ./../../home-manager/programs/zen.nix
    ./../../home-manager/programs/shell.nix
  ];

	
  # Desktop-specific Home Manager packages
  home.packages = with pkgs; [
    discord
    spotify
  ];
}
