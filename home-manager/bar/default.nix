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
    nerd-fonts.jetbrains-mono
    libnotify
    playerctl
  ];
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 36;
      spacing = 6;
      modules-left = [ "mango/workspaces" "mango/window"];
      modules-center = [ "clock" ];
      modules-right = [ 
        "cpu" 
        "memory" 
        "pulseaudio" 
        "battery" 
        "custom/power-profile" 
        "network"
        "bluetooth"
        "custom/power"
      ];

      "pulseaudio" = {
        format = "{volume}% <span size='x-large'>{icon}</span>";
        format-bluetooth = "{volume}% <span size='x-large'>{icon}</span>";
        format-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "󰂑";
          headset = "󰂑";
          phone = "";
          phone-muted = "";
          portable = "";
          car = "";
          default = ["" ""];
        };
        scroll-step = 1;
        on-click = "pavucontrol";
      };
      "cpu" = {
        format = "<span size='x-large'>{icon}</span> {usage:>2}%";
        format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
      };

      "memory" = {
        format = "{used:0.1f}G/{total:0.1f}G <span size='x-large'></span>";
        tooltip-format = "Swap: {swapUsed:0.1f}G/{swapTotal:0.1f}G";
      };
      "network" = {
        format-wifi = "<span size='x-large'>{icon}</span>";
        format-icons = ["󰢿" "󰢼" "󰢽" "󰢾" ];
        format-ethernet = "";
        format-disconnected = "";
        on-click = "nm-connection-editor";
      };
      "bluetooth" = {
        format = "<span size='x-large'></span> {status}";
        format-connected = " {device_alias}";
        format-connected-battery = " {device_alias} {device_battery_percentage}%";
      };
      "custom/power-profile" = {
        exec = "~/.config/waybar/scripts/power-profile.sh";
        interval = 1;
        on-click = "~/.config/waybar/scripts/select-power-profile.sh";
      };

      "battery" = {
        format = "{capacity}% <span size='x-large'>{icon}</span>";
        states = {
          warning  = 25;
          critical = 10;
        };
        on-click = "~/.config/waybar/scripts/select-power-profile.sh";
        events = {
          on-discharging-warning = "notify-send -u normal 'Low Battery'";
          on-discharging-critical = "notify-send -u critical 'Very Low Battery'";
          on-charging-100 = "notify-send -u normal 'Battery Full!'";
          on-discharging = "notify-send -u normal 'Power Switch, Discharging'";
          on-charging = "notify-send -u normal 'Power Switch, Charging'";
        };
        format-icons = {
            default =  ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
      };

      "custom/power" = {
        format = "<span size='x-large'>⏻</span>";
        menu = "on-click";
        menu-file = "${config.xdg.configHome}/waybar/power_menu.xml";
        menu-actions = {
            shutdown = "shutdown now";
            reboot = "reboot";
            suspend = "systemctl suspend";
        };
      };
    };
  };
 xdg.configFile."waybar/power_menu.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <interface>
      <menu id="menu">
        <item>
          <attribute name="label">Sleep</attribute>
          <attribute name="action">menu.suspend</attribute>
        </item>
        <item>
          <attribute name="label">Restart</attribute>
          <attribute name="action">menu.reboot</attribute>
        </item>
        <item>
          <attribute name="label">Shutdown</attribute>
          <attribute name="action">menu.shutdown</attribute>
        </item>
      </menu>
    </interface>
  '';
  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/scripts/power-profile.sh" = {
    source = ./scripts/power-profile.sh;
    executable = true; 
  };
  xdg.configFile."waybar/scripts/select-power-profile.sh" = {
    source = ./scripts/select-power-profile.sh;
    executable = true; 
  };
}
