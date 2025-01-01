{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-frappe";
    package = pkgs.kdePackages.sddm; # this apparently fixes it, so don't touch lmao
  };
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      font = "JetBrainsMono Nerd Font";
      fontSize = "14";
    })
  ];
}
