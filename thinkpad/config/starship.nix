{ lib, pkgs, ... }:

{
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
}
