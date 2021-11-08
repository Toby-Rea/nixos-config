{ pkgs }:

with pkgs;
let
  modifier = "Mod4";
in {
 "${modifier}+Shift+Return" = "exec ${foot}/bin/foot";
 "${modifier}+Shift+q" = "kill";
 "${modifier}+Shift+c" = "reload";
 "${modifier}+Shift+e" = "exit";
 "${modifier}+d" = "exec ${dmenu}/bin/dmenu_run";
 "${modifier}+1" = "workspace number 1";
 "${modifier}+2" = "workspace number 2";
 "${modifier}+3" = "workspace number 3";
 "${modifier}+4" = "workspace number 4";
 "${modifier}+5" = "workspace number 5";
 "${modifier}+6" = "workspace number 6";
 "${modifier}+7" = "workspace number 7";
 "${modifier}+8" = "workspace number 8";
 "${modifier}+9" = "workspace number 9";
 "${modifier}+Shift+1" = "move container to workspace number 1";
 "${modifier}+Shift+2" = "move container to workspace number 2";
 "${modifier}+Shift+3" = "move container to workspace number 3";
 "${modifier}+Shift+4" = "move container to workspace number 4";
 "${modifier}+Shift+5" = "move container to workspace number 5";
 "${modifier}+Shift+6" = "move container to workspace number 6";
 "${modifier}+Shift+7" = "move container to workspace number 7";
 "${modifier}+Shift+8" = "move container to workspace number 8";
 "${modifier}+Shift+9" = "move container to workspace number 9";
 "${modifier}+h" = "splith";
 "${modifier}+v" = "splitv";
 "${modifier}+s" = "floating toggle";
 "${modifier}+f" = "fullscreen";
 "XF86AudioMute" = "exec ${pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
 "XF86AudioRaiseVolume" = "exec ${pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
 "XF86AudioLowerVolume" = "exec ${pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
 "XF86MonBrightnessUp" = "exec ${brightnessctl}/bin/brightnessctl set +10%";
 "XF86MonBrightnessDown" = "exec ${brightnessctl}/bin/brightnessctl set 10%-";
 "Print" = "exec ${grim}/bin/grim | ${wl-clipboard}/bin/wl-copy -t image/png"; 
}
