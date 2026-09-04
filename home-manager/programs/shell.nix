{ pkgs,lib, ... }:
{
  imports = [ ];
  # Define common home-manager packages
  home.packages = with pkgs; [
    zsh-syntax-highlighting
    nerd-fonts.geist-mono
  ];

  fonts.fontconfig.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    shellAliases = {
      ll = "ls -alF";
      gc = "git commit -v";
      gs = "git status";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config#\$(hostname)";
    };

   initContent = lib.mkMerge [
      # Instant prompt must be the very first thing to run
      (lib.mkOrder 500 ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')
      (lib.mkOrder 1000 ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
        # Override prompt character with a lambda, regardless of what the wizard set
        typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_CONTENT_EXPANSION="λ"
        typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_CONTENT_EXPANSION="λ"
        # optional: disable the default nerd-font arrow glyph fallback so plain λ renders cleanly
        typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_{VIINS,VICMD,VIVIS,VIOWR}_VISUAL_IDENTIFIER_EXPANSION=""
      '')
      (lib.mkOrder 1500 ''
        eval "$(fzf --zsh)"
      '')
    ];
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "GeistMono Nerd Font Mono"; # match exactly what fc-list showed
      size = 14;
    };
    settings = {
      shell = "zsh";
      confirm_os_window_close = -1; # Only warn on close if a job is running
    };
    themeFile = "kanagawa";
    enableGitIntegration = true;
    shellIntegration = {
      enableZshIntegration = true;
    };
  };

}
