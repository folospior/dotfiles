{...}: {
  # TODO: Everything tbh
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      spacing = 12;
      margin-top = 6;
      margin-left = 12;
      margin-right = 12;
      modules-left = [
        "hyprland/window"
        "pulseaudio"
      ];
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "backlight"
        "battery"
        "tray"
        "clock"
      ];

      # Modules configuration

      "pulseaudio" = {
        format-icons = ["󰕿" "󰖀" "󰕾"];
        format = "{icon} {volume}%";
      };

      "hyprland/window" = {
        separate-outputs = true;
      };

      "clock" = {
        tooltip = false;
        format-alt = "{:%d/%m/%Y}";
      };

      "tray" = {
        spacing = 6;
      };

      "battery" = {
        format-full = "󰁹 Full";
        format-discharging = "{icon} {capacity}%";
        tooltip-format = "󰚥 {power:.1f}W";
        format-icons = ["󰂎" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
        interval = 5;
      };

      "backlight" = {
        format-icons = ["" "" "" "" ""];
        format = "{icon} {percent}%";
      };
    };
    systemd = {
      enable = true;
      target = "wayland-session@Hyprland.target";
    };
    style = builtins.readFile ./waybar.css;
  };
}
