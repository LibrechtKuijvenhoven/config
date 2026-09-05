{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.mango.hmModules.mango
  ];
  home.packages = with pkgs; [
    networkmanagerapplet
    hyprpolkitagent
    swaylock
    swayidle
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 100;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        frame_color = "#89b4fa";
        font = "sans 10";
      };
      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        timeout = 5;
      };
    };
  };
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1e1e2e";
      indicator-radius = 100;
      indicator-thickness = 7;
      show-failed-attempts = true;
    };
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      { timeout = 600; command = "systemctl suspend"; }
    ];
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f"; }
    ];
  };

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;

      # start waybar with mango
    autostart_sh = ''
      waybar &
      ${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent &
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
        "SUPER,l,spawn,swaylock -f"
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
