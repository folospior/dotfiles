{pkgs, ...}: {
  gtk = {
    enable = true;
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
    font.name = "Jetbrains Mono";
    cursorTheme = {
      package = pkgs.posy-cursors;
      name = "Posy's Cursor Black";
    };
    iconTheme = {
      package = pkgs.papirus-nord;
      name = "Papirus-Dark";
    };
  };

  home.pointerCursor = {
    package = pkgs.posy-cursors;
    name = "Posy's Cursor Black";
    x11.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
  };

}
