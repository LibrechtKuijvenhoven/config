{ config, pkgs, inputs,...}:
{
  environment.systemPackages = with pkgs; [
    git
    lazygit
    alacritty
    clang
  
    # some cmds
    fd
    ripgrep
    tree 
    htop
    fastfetch
    fzf
    # rust stuff
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy

    # go stuff 
    go 
    gopls

    lua-language-server
    tree-sitter
    nodejs

    nix-ld
    texlive.combined.scheme-basic
    xclip
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    
    # colorschemes.kanagawa.enable = true;
  };

  # language servers
}
