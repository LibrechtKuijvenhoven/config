{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.mango.hmModules.mango
  ];
  home.packages = with pkgs; [
    networkmanagerapplet
    polkit_gnome
  ];

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;

      # start waybar with mango
    autostart_sh = ''
      waybar &
      /run/current-system/sw/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  nm-applet --indicator &
    '';
    settings = {
      animations = 1;
      bordercolor = "0x595959aa";

      bind = [
        "SUPER,Return,spawn,kitty"
        "SUPER,d,spawn,rofi -show drun"
        "SUPER,r,reload_config"
        "SUPER,q,killclient"
        "NONE,XF86MonBrightnessUp,spawn,brightnessctl set +5%"
        "NONE,XF86MonBrightnessDown,spawn,brightnessctl set 5%-"
      ];

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
