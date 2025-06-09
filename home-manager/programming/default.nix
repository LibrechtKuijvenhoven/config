{ pkgs, ... }:

{
  imports = [
    ./languages/default.nix
    # Add any other language configuration files here
  ];
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "GeistMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "GeistMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "GeistMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "GeistMono Nerd Font";
          style = "Bold Italic";
        };
        size = 16;
      };
   }
}
