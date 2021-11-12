{ pkgs, ... }: {

  programs.mako = {
    enable = true;
    width = 340;
    backgroundColor = "#FFFFFFFF";
    textColor = "#161616FF";
    padding = "16";
    defaultTimeout = 4000;
  };

}
