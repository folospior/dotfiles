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
    hunspellDicts.en-gb-large
    hunspellDicts.pl-pl
    hunspellDicts.de-de
    steam
    mangohud
    qbittorrent
    wineWowPackages.staging
    lutris
    boinc
  ];
}
