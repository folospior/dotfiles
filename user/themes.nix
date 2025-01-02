{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    font.name = "Jetbrains Mono";
    iconTheme = {
      package = pkgs.papirus-nord;
      name = "Papirus-Dark";
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
