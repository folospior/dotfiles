{spicetifyPkgs, ...}: {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
    ];
    theme = spicetifyPkgs.themes.sleek;
    colorScheme = "Nord";
  };
}