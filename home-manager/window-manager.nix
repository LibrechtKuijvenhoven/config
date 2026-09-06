{ config, pkgs, inputs, ... }:
{
  imports = [
    ./bar/default.nix
  ];
  home.packages = with pkgs; [
    networkmanagerapplet
    hyprpolkitagent
    swaylock
    swayidle
    nerd-fonts.jetbrains-mono
    libnotify
    playerctl
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
  services.swayosd = {
    enable = true;
    topMargin = 0.9;
  };

  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 900; command = "${pkgs.swaylock}/bin/swaylock -f"; }
      { timeout = 1800; command = "systemctl suspend"; }
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

        "SUPER,Tab,focusstack,next"
        "SUPER+SHIFT,Tab,focusstack,prev"
        "SUPER,j,focusdir,down"
        "SUPER,k,focusdir,up"
        "SUPER,h,focusdir,left"
        "SUPER,l,focusdir,right"

        # Workspace/tag switching
        "SUPER,1,view,1,0"
        "SUPER,2,view,2,0"
        "SUPER,3,view,3,0"
        "SUPER,4,view,4,0"
        "SUPER,5,view,5,0"
        "SUPER,6,view,6,0"
        "SUPER,7,view,7,0"
        "SUPER,8,view,8,0"
        "SUPER,9,view,9,0"

        # Move focused window to a tag (and follow it)
        "SUPER+SHIFT,1,tag,1,0"
        "SUPER+SHIFT,2,tag,2,0"
        "SUPER+SHIFT,3,tag,3,0"
        "SUPER+SHIFT,4,tag,4,0"
        "SUPER+SHIFT,5,tag,5,0"
        "SUPER+SHIFT,6,tag,6,0"
        "SUPER+SHIFT,7,tag,7,0"
        "SUPER+SHIFT,8,tag,8,0"
        "SUPER+SHIFT,9,tag,9,0"

        # Sequential tag navigation (adjacent tag left/right)
        "CTRL+ALT,Left,viewtoleft,0"
        "CTRL+ALT,Right,viewtoright,0"

        "SUPER+SHIFT,l,spawn,swaylock -f"

        "NONE,XF86MonBrightnessUp,spawn,swayosd-client --brightness raise"
        "NONE,XF86MonBrightnessDown,spawn,swayosd-client --brightness lower"

        # Volume
        "NONE,XF86AudioRaiseVolume,spawn,swayosd-client --output-volume raise"
        "NONE,XF86AudioLowerVolume,spawn,swayosd-client --output-volume lower"
        "NONE,XF86AudioMute,spawn,swayosd-client --output-volume mute-toggle"

        # Playback
        "NONE,XF86AudioPlay,spawn,swayosd-client --playerctl play-pause"
        "NONE,XF86AudioNext,spawn,swayosd-client --playerctl next"
        "NONE,XF86AudioPrev,spawn,swayosd-client --playerctl prev"
      ];

    };
  };

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark"; # any built-in or custom theme
  };
}
