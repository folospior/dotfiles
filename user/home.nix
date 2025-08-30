{
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./${systemSettings.desktop}.nix
    ./${userSettings.browser}.nix
    ./${userSettings.terminal}.nix
    ./direnv.nix
    ./fastfetch.nix
    ./git.nix
    ./gleam.nix
    ./overlays.nix
    ./gpg.nix
    ./helix.nix
    ./misc.nix
    #./nvf.nix
    ./nushell.nix
    # ./qutebrowser.nix # temporary - needs importing & stuff
    ./spotify.nix
    ./themes.nix
    ./vscode.nix
    # ./zsh.nix
    # ./zed.nix
    #./nixvim.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  nixpkgs.config.allowUnfree = true;

  xdg.userDirs.createDirectories = true;

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
