{ config, inputs, lib, pkgs, ... }:

{
  imports = [
    ./config/sway.nix
    ./config/emacs.nix
  ];

  programs.home-manager.enable = true;
  home.username = "toby";
  home.homeDirectory = "/home/toby";

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = true;
      format = "$directory [|](bold purple) ";
      directory = {
        style = "bold purple";
      };
    };
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Toby Rea";
    userEmail = "toby.e.rea@protonmail.com";
  };

  programs.firefox.enable = true;

  programs.zathura.enable = true;
  programs.mpv.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
    };
  };
}
