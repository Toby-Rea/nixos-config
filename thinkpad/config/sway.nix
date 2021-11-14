{ lib, pkgs, ... }: {
  
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    
    config = {
      modifier = "Mod4";
      terminal = "${pkgs.foot}/bin/foot";
      menu = "${pkgs.rofi}/bin/rofi -show drun";
      
      input = {
        "type:keyboard" = {
          xkb_layout = "gb";
          xkb_model = "pc105";
          repeat_delay = "250";
          repeat_rate = "40";
        };
      };

      gaps.inner = 12;
      gaps.outer = 12;
      window.border = 3;
      floating.border = 3;

      colors.background = "#D0D0D0";
      colors.focused = { border = "#D0D0D0"; childBorder = "#D0D0D0"; background = "#D0D0D0"; text = "#D0D0D0"; indicator = "#D0D0D0"; };
      colors.focusedInactive = { border = "#D0D0D0"; childBorder = "#D0D0D0"; background = "#D0D0D0"; text = "#D0D0D0"; indicator = "#D0D0D0"; };
      colors.unfocused = { border = "#D0D0D0"; childBorder = "#D0D0D0"; background = "#D0D0D0"; text = "#D0D0D0"; indicator = "#D0D0D0"; };
      colors.urgent = { border = "#D0D0D0"; childBorder = "#D0D0D0"; background = "#D0D0D0"; text = "#D0D0D0"; indicator = "#D0D0D0"; };
      colors.placeholder = { border = "#D0D0D0"; childBorder = "#D0D0D0"; background = "#D0D0D0"; text = "#D0D0D0"; indicator = "#D0D0D0"; };

      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
      modes = { };
      keybindings = lib.mkOptionDefault (import ./keybinds.nix { inherit pkgs; });
    };

    extraConfig = ''
      output eDP-1 mode --custom 1920x1080@60Hz
      output * bg #D4D4D4 solid_color
    '';

    extraSessionCommands = ''
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
    '';
  };

  home.packages = with pkgs; [
    swaylock
    swayidle
    wl-clipboard
    grim
    dmenu
    brightnessctl
  ];
  
}
