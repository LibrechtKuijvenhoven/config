{ pkgs, config, lib, ... }:

{
  # Enable nixvim for your user
  programs.nixvim = {
    enable = true;

    # Import all your plugin configurations
    imports = [
      ./plugins/default.nix
    ];

    };
}
