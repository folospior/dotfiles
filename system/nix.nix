{
  inputs,
  userSettings,
  ...
}: {
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["flakes" "nix-command"];
  
  programs.nh = {
    enable = true;
    flake = "/home/${userSettings.username}/dotfiles";
    clean.enable = true;
    clean.dates = "daily";
  };
}
