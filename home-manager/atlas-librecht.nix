{ config, pkgs, ... }:

{
  imports = [
    ./shared.nix
  ];

  # Desktop-specific Home Manager packages
  home.packages = with pkgs; [
    discord
    spotify
    steam
    # Add any other packages specific to your desktop setup
  ];
}
