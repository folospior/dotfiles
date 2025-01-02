{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    btop
    mlocate
    exercism
  ];
}