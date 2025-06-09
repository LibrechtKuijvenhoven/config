config, pkgs, ... }:

{
  imports = [
    ./programs/git.nix
    # Add other shared programs or services here
    # ./services/syncthing.nix
  ];

  # Common system-wide packages or settings
  environment.systemPackages = with pkgs; [
    vim # Just an example, home-manager is often better for user tools
    htop
    wget
    brave
    discord
    alsa-utils
    pulseaudio
    pavucontrol
    wireplumber
  ];

  # Common system-wide services
  services.journald.extraConfig = "SystemMaxUse=100M"; # Limit journal size

  # Set default editor for root (sudo nixos-rebuild switch)
  environment.variables.EDITOR = "nvim"; # Or "vim", "nano"

  # Basic security settings
  security.polkit.enable = true;
  security.sudo.wheelNeedsPassword = false; # Or true, depending on preference

  # Some useful utilities for the Nix Store
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
}
