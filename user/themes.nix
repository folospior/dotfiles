{config, pkgs, pkgsAppleEmoji, ...}: {
  gtk = {
    enable = true;
    # font.name = "Ubuntu";
    iconTheme = {
      package = pkgs.papirus-nord;
      name = "Papirus-Dark";
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      serif = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu";
      };
      sansSerif = config.stylix.fonts.serif;
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };
      emoji = {
        package = pkgsAppleEmoji.apple-emoji-linux;
        name = "Apple Color Emoji";
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
    style.package = pkgs.adwaita-qt;
  };

  home.pointerCursor = {
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Black"; # has to be file name
    size = 24;
    x11.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
  };
}
