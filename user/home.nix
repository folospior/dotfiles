{systemSettings, userSettings, ...}: {
  imports = [
    ./${userSettings.browser}.nix
    ./${userSettings.terminal}.nix
    ./${systemSettings.desktop}.nix
    ./direnv.nix
    ./fastfetch.nix
    ./misc.nix
    ./git.nix
    ./gleam.nix
    ./nvf.nix
    ./themes.nix
    ./spotify.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "folo";
  home.homeDirectory = "/home/folo";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
