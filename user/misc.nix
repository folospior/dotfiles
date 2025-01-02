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
  ];
}