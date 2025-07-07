{ config, pkgs, ... }:

{
  imports = [
    ./programming/default.nix
  ];
  home.username = "librechtk";
  home.homeDirectory = "/home/librechtk";

  # Define common home-manager packages
  home.packages = with pkgs; [
    neovim # For user, not system-wide
    zsh-syntax-highlighting
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

  # Example Zsh configuration
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true; # Or enable if you prefer
      theme = "powerlevel10k";
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
      ];
    };
    shellAliases = {
      ll = "ls -alF";
      gc = "git commit -v";
      gs = "git status";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#\$(hostname)";
    };
    initContent = ''
      # Your custom Zsh initializations
      eval "$(fzf --zsh)"
    '';
  };

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
