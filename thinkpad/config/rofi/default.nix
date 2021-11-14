{ pkgs, config, ... }: {

    programs.rofi = {
    enable = true;
    extraConfig = {
      show-icons = true;
      font = "Sarasa Mono K 13";
      display-run = ":: ";
      display-drun = ":: ";
    };
    theme = import ./theme.nix { inherit config; };
  };
  
}
