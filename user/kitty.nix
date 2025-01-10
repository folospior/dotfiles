{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    themeFile = "Nord";
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      font_size = 15.0;
      cursor_blink_interval = "cubic-bezier(0.7, 0, 0.84, 0)";
      cursor_trail = 1;
    };
  };
}
