{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-frappe";
  };
  environment.systemPackages = [pkgs.catppuccin-sddm];
}
