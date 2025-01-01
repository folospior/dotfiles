{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-frappe";
  };
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      font = "JetBrainsMono Nerd Font";
      fontSize = "14";
    })
  ];
}
