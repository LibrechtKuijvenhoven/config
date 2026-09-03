{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim # homeManagerModules is for version 24.11 of nixvim
    ./programming/default.nix
    ../modules/programs/nvim
  ];
  home.username = "librechtk";
  home.homeDirectory = "/home/librechtk";

  # Define common home-manager packages
  home.packages = with pkgs; [
    fzf
    bat
    eza
    ripgrep
    fd
    htop
    fastfetch
    lazygit
    tree


    gimp
    libreoffice-qt6-fresh
    brave
    nerd-fonts.geist-mono
  ];

  # fonts
  fonts.fontconfig.enable = true;
  #fonts.packages = with pkgs; [
  #  nerdfonts.geist-mono
  #];
  #fonts.packages = with pkgs; [
    # ... other fonts you have
  #  nerdfonts.geist-mono
  #] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);


  programs.git = {
    enable = true;
    userName = "LibrechtKuijvenhoven";
    userEmail = "librecht@live.nl";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Enable GTK theming for consistent look and feel
  gtk.enable = true;
  gtk.font.name = "Cantarell 10";
  gtk.theme.name = "Adwaita"; # Or your preferred theme

  # XDG Base Directory Specification
  xdg.enable = true;
  xdg.userDirs.enable = true;
  

  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Add any other shared dotfiles or configurations
  # programs.alacritty.enable = true; # Example: Alacritty config managed by HM
  # programs.vscode.enable = true;

  # Your Home Manager state version (important for upgrades)
  home.stateVersion = "24.11"; # Keep this updated with your Nixpkgs version
}
