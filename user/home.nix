{systemSettings, userSettings, ...}: {
  imports = [
    ./${userSettings.browser}.nix
    ./${systemSettings.desktop}.nix
    ./discord.nix
    ./git.nix
    ./gleam.nix
    ./nixvim.nix
    ./vscode.nix
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
