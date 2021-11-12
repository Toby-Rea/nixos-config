{ pkgs, ... }: {

  programs.mako = {
    enable = true;
    
    font = "monospace 12";
    anchor = "top-right";
    layer = "top";
        
    width = 400;
    height = 140;
    borderSize = 3;
    margin = "8";
    padding = "16";
    
    backgroundColor = "#FFFFFFFF";
    textColor = "#161616FF";
    borderColor = "#D0D0D0FF";
    
    defaultTimeout = 4000;
  };

}
