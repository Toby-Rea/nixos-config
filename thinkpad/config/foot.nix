{ lib, pkgs, ... }: {
  
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=8";
        font-bold = "monospace:weight=bold:size=8";
        font-italic = "monospace:slant=italic:size=8";
        font-bold-italic = "monospace:weight=bold:slant=italic:size=8";
        pad = "32x32 center";
      };
      
      cursor = {
        blink = "yes";
      };
      
      colors = {
        foreground = "161616";
        background = "ffffff";
        regular0 = "525252";
        regular1 = "cc9393";  # red
        regular2 = "7f9f7f";  # green
        regular3 = "d0bf8f";  # yellow
        regular4 = "6ca0a3";  # blue
        regular5 = "dc8cc3";  # magenta
        regular6 = "93e0e3";  # cyan
        regular7 = "dcdccc";  # white
        bright0 = "666666";   # bright black
        bright1 = "dca3a3";   # bright red
        bright2 = "bfebbf";   # bright green
        bright3 = "f0dfaf";   # bright yellow
        bright4 = "e7f5ff"; 
        bright5 = "fcace3";   # bright magenta
        bright6 = "b3ffff";   # bright cyan
        bright7 = "ffffff";   # bright white
        selection-foreground = "161616";
        selection-background = "d4d4d4";
      };
    };
  };
  
}
