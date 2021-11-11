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
        sansSerif = [ "Inter" ];
        # monospace = [ "VictorMono Nerd Font" ];
        monospace = [ "Sarasa Mono K" ];
      };
    };
  };
  
}
