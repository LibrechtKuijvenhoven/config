{ config, pkgs, ... }:

{

  # Desktop-specific Home Manager packages
  home.packages = with pkgs; [
    discord
    spotify
    steam

    tmux
    # Add any other packages specific to your desktop setup
  ];
	
  programs.tmux = {
	enable = true;
	shortcut = "a";
	baseIndex = 1;
	keyMode="vi";
	clock24 = true;
	extraConfig = ''
		set -g mouse on
	'';
  };
};
