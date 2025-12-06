{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    inconsolata
    fira-sans
    nerd-fonts.jetbrains-mono
    corefonts
    vista-fonts
    ubuntu-classic
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.intone-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.fantasque-sans-mono
  ];
}
