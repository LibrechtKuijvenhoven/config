{ pkgs, config, lib, ... }:

{
  # Enable nixvim for your user
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    # Import all your plugin configurations
    imports = [
      ./plugins/default.nix
      ./keymaps.nix
    ];
    colorschemes.kanagawa.enable = true;
    plugins.web-devicons.enable = true;

    };
}
