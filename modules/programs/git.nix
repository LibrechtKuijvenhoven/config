{ config, pkgs, ... }:

{
  # System-wide Git installation
  environment.systemPackages = with pkgs; [
    git
  ];
}
