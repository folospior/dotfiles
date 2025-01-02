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
    platformTheme.name = "qt5ct";
    style.name = "Utterly Nord Plasma";
    style.package = pkgs.utterly-nord-plasma;
  };
  home.packages = with pkgs; [libsForQt5.qtstyleplugin-kvantum libsForQt5.qt5ct];

  home.pointerCursor = {
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Black"; # has to be file name
    size = 24;
    x11.enable = true;
    gtk.enable = true;
    hyprcursor.enable = true;
  };
}
