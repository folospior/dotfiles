{pkgs, ...}: {
  home.packages = [pkgs.alacritty pkgs.rofi-wayland]; # temporary
  wayland.windowManager.hyprland = {
    enable = true;
  };
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, 1920x0, 1"
    ];

    "$mod" = "SUPER";

    bind =
      [
        "$mod, B, exec, firefox"
        "$mod SHIFT, Return, exec, alacritty"
        "$mod, V, exec, code"
        "$mod SHIFT, Q, killactive"
        "$mod SHIFT, E, exit"
        "$mod, P, exec, rofi -show drun"
      ]
      ++ ( # i just took this from the hyprland wiki and it works so i guess??
        builtins.concatLists (builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );

    bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];
  };
}
