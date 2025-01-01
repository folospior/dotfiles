{userSettings, ...}: {
  imports = [
    ./discord.nix
    ./vscode.nix
    ./${userSettings.browser}.nix
    ./nixvim.nix
    ./gleam.nix
    ./git.nix
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
