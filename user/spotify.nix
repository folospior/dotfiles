{spicetifyPkgs, ...}: {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
    ];
  };
}
