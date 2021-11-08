{ config, pkgs, lib, ... }:

{
  fonts = {
    fonts = with pkgs; [
      inter
      (nerdfonts.override { 
        fonts = [ 
          "JetBrainsMono"
          "VictorMono"
        ];
      })
    ];

    fontconfig = {
      defaultFonts = {
        sansSerif = [ "Inter" ];
        monospace = [ "VictorMono Nerd Font" ];
      };
    };
  };
}
