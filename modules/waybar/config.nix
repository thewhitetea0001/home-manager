{ pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  home.file.".config/waybar/config.jsonc".text = ''
    {
      "name": "bar",
      "layer": "left",
      "position": "left",
      "height": "500",
      "width": "32",
      "margin-left": 7,
      "margin-top": 7,
      "margin-bottom": 7,

      "modules-left": [
        "pulseaudio/slider",
        "pulseaudio#audio",
        "pulseaudio"
      ],

      "modules-center": [],

      "modules-right": [
        "hyprland/language",
        "custom/split",
        "battery",
        "network",
        "custom/split",
        "clock"
      ],

      /* == Modules Left  ==*/
      "pulseaudio/slider": { "min": 0, "max": 140, "orientation": "vertical" },
      "pulseaudio#audio": {
        "format": "{icon}",
        "format-bluetooth": "󰂯\n{icon}",
        "format-bluetooth-muted": "󰂯\n󰖁",
        "format-muted": "󰖁",
        "format-icons": {
          "headphone": "󰋋",
          "hands-free": "󰋋",
          "headset": "󰋋",
          "phone": "",
          "portable": "",
          "car": "",
          "default": ["󰕿", "󰖀", "󰕾"]
        },
        "on-click": "pactl set-sink-mute @DEFAULT_SINK@ toggle",
        "on-scroll-up": "pactl set-sink-volume @DEFAULT_SINK@ +1%",
        "on-scroll-down": "pactl set-sink-volume @DEFAULT_SINK@ -1%",
        "tooltip": true,
        "tooltip-format": "{icon} {desc}: {volume}%"
      },

      "pulseaudio": { 
        "format": "{icon}", 
        "format-icons": [""], 
        "scroll-step": 5, 
        "on-click": "pavucontrol", 
        "tooltip": true, 
        "tooltip-format": 
        "{volume}", 
        "slider": true 
      },

      /* == Modules Right  ==*/
      "battery": {
        "bat": "BAT0",
        "interval": 10,
        "format": "{icon}",
        "format-icons": [
          "󰂎",
          "󰁺",
          "󰁻",
          "󰁼",
          "󰁽",
          "󰁾",
          "󰁿",
          "󰂀",
          "󰂁",
          "󰂂",
          "󰁹"
        ],

        "states": {
          "warning": 30,
          "critical": 15
        },
      },

      "network": { 
        "format": "{icon}", 
        "format-icons": [
          "󰤯",
          "󰤟",
          "󰤢",
          "󰤥",
          "󰤨"
        ], 
        
        "tooltip": true, 
        "tooltip-format": "{ifname}: {essid} {signalStrength}%",
        "interval": 2 
      },
        
      "custom/split": { 
        "format":"__", 
        "tooltip": false 
      },

      "clock": { 
        "format":"{:%y\n%m\n%d\n\n%H\n%M\n%S}", 
        "interval":1, 
        "tooltip":true, 
        "tooltip-format":"Year/Month/Day\n\nHours/Minutes/Seconds" 
      },

      "hyprland/language": {
        "format": "{}",
        "format-en": "en",
        "format-ru": "ru",
        "format-sk": "sk",
      }
    }
  '';
}
