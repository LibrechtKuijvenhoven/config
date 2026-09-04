{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
    settings = {
      animations = 1;
      bordercolor = "0x595959aa";

      bind = [
        "SUPER,Return,spawn,kitty"
        "SUPER,d,spawn,rofi -show drun"
        "SUPER,r,reload_config"
        "SUPER,q,killclient"
        "SUPER SHIFT,e,quit"
      ];

      # start waybar with mango
      autostart_sh = ''
        waybar &
      '';
    };
  };

  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      modules-left = [ "mango/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" "tray" ];
    };
  };
  # waybar under mango sometimes needs its systemd unit enabled
  # if you switch to systemd-managed waybar instead of autostart_sh:
  # programs.waybar.systemd.enable = true;

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark"; # any built-in or custom theme
  };
}
