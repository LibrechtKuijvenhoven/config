{ config, pkgs,inputs, ... }:

{
  imports = [
    ./../../home-manager/shared.nix
    ./../../home-manager/programs/zen.nix
  ];

	
  # Desktop-specific Home Manager packages
  home.packages = with pkgs; [
    discord
    spotify
  ];
}
