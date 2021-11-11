{ pkgs, ... }: {
  
  programs.waybar = {
    enable = true;
    settings = [
      {
        position = "top";
        height = 36;
        modules-left = [ "sway/workspaces" ];
        modules-right = [ "pulseaudio" "network" "backlight" "battery" "clock" "tray" ];
        modules = {
          "sway/workspaces" = {
            current-only = true;
            disable-scroll = true;
            format = "{index}";
          };
          "tray" = {
	          spacing = 16;
	        };
          "clock" = {
            format = " {:%H:%M}";
            tooltip-format = "<big>{:%d %B %Y}</big>\n<tt><small>{calendar}</small></tt>";
          };
          "backlight" = {
            format = " {percent}%";
          };
          "battery" = {
            states = {
              warning = 25;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-icons = [ "" "" "" "" "" ];
          };
          "network" = {
            format-wifi = " {essid}";
            format-ethernet = "{ipaddr}/{cidr} ";
            tooltip-format-wifi = "Connected: {essid} ({signalStrength}%)";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = " disconnected";
            on-click = "${pkgs.foot}/bin/foot nmtui";
          };
          "pulseaudio" = {
            format = "{icon} {volume}% | {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " | {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
            };
            on-click = "pavucontrol";
          };
        };
      }
    ];

    style = ''
      * {
        border: none;
        font-family: monospace, sans-serif;
        font-size: 16px;
      }

      window#waybar {
        background-color: rgba(250, 249, 251, 1.0);
        transition-property: background-color;
        transition-duration: .5s;
      }

      #clock,
      #battery,
      #backlight,
      #network,
      #pulseaudio,
      #tray {
        color: rgba(82, 82, 82, 1.0);
        padding: 0 6px;
        margin: 2px 5px 2px 5px;
        background-clip: padding-box;
      }

      #workspaces button {
        background-color: rgba(82, 82, 82, 1.0);
        color: rgba(250, 249, 251, 1.0);
        padding: 0 2px;
        border-radius: 0px;
        min-width: 20px;
        margin: 2px;
      }
      
      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }
      
      #battery.critical:not(.charging) {
        color: rgba(218, 30, 40, 1.0);
      }
      
      #battery.plugged,
      #battery.charging {
        color: rgba(38, 166, 91, 1.0);
      }
      
      tooltip {
        background-color: rgba(250, 249, 251, 1.0);
      }
      
      tooltip label {
        color: rgba(82, 82, 82, 1.0);
      }
      
      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      }
    '';
  };
  
}
