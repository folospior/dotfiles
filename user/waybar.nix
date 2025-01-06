{...}: {
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "hyprland/window"
      ];
      modules-right = [
        "tray"
      ];
    };
    systemd = {
      enable = true;
      target = "wayland-session@Hyprland.target";
    };
    style = builtins.readFile ./waybar.css;
  };
}
