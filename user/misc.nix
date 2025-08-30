{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    btop
    mlocate
    exercism
    cowsay
    kdePackages.kdenlive
    grimblast
    gimp3
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
    wl-clipboard
    ripgrep
    clang # required for some treesitter apparently :(
    tree-sitter
    nodejs
    prismlauncher
    brightnessctl
    cliphist
    heroic
#    ciscoPacketTracer8
    gamescope
    zenity
    wireshark
    insomnia
    tealdeer
    mpv
    pavucontrol
    tree
    unzip
    file
    rar
    zip
    p7zip
    tokei
    fd
    bat
    inetutils
    filezilla
  ];
}
