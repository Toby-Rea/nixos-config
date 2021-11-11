{ pkgs, ... }: {
  
  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "VictorMono"
          "FiraCode"
        ];
      })
      emacs-all-the-icons-fonts
      sarasa-gothic
      inter
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "Sarasa Mono K" ];
        sansSerif = [ "Sarasa UI K" ];
        serif = [ "Sarasa UI K"];
      };
    };
  };
  
}
