{ config, pkgs, inputs, ... }:

{
  imports = [
  ];
  # Define common home-manager packages
  home.packages = with pkgs; [
    zsh-syntax-highlighting
  ];
  # Example Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
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
      eval "$(fzf --zsh)"
    '';
  };

  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    enableZshIntegration = true;
  };

}
