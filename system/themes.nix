{
  config,
  pkgs,
  userSettings,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = userSettings.theme;
    fonts = {
      serif = {
        package = pkgs.ubuntu_font_family;
        name = "Ubuntu";
      };
      sansSerif = config.stylix.fonts.serif;
      monospace = {
        package = pkgs.maple-mono.NF;
        name = "Maple Mono NF";
      };
    };
  };
}
