{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    btop
    mlocate
    exercism
    cowsay
    kdePackages.kdenlive
    grimblast
    gimp
    skypeforlinux
    peaclock
    # spotify
    libreoffice
    hunspell
    hunspellDicts.en-us-large # idk if large makes a difference
    hunspellDicts.pl-pl
    hunspellDicts.de-de
  ];
}
