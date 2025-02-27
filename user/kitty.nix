{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "Nord";
    font = {
      name = "IntoneMono Nerd Font";
      package = pkgs.nerd-fonts.intone-mono;
    };
    settings = {
      # TODO: Add on-click events
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      font_size = 13.5;
      font_features = "+ss01";
      cursor_shape = "block";
      cursor_blink_interval = "cubic-bezier(0.7, 0, 0.84, 0)";
      cursor_trail = 1;
      background_opacity = 0.8;
    };
    shellIntegration = {
      mode = "no-cursor";
      enableBashIntegration = true;
    };
  };
}
