 config, pkgs, ... }:

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
    tmux
    fzf
    bat
    eza
    ripgrep
    fd
    htop
    fastfetch
    
    gimp
    libreoffice-qt6-fresh
    teams
  ];

  # Example Zsh configuration
  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true; # Or enable if you prefer
    shellAliases = {
      ll = "ls -alF";
      gc = "git commit -v";
      gs = "git status";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#\$(hostname)";
    };
    initExtra = ''
      # Your custom Zsh initializations
      eval "$(fzf --zsh)"
    '';
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0"; # Check latest tag
          sha256 = "sha256-hash-here"; # Use nix-prefetch-url or similar
        };
      }
    ];
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
  

  # fonts
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = ["geist-mono"];})
  ];
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Add any other shared dotfiles or configurations
  # programs.alacritty.enable = true; # Example: Alacritty config managed by HM
  # programs.vscode.enable = true;

  # Your Home Manager state version (important for upgrades)
  home.stateVersion = "24.11"; # Keep this updated with your Nixpkgs version
}
