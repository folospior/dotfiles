{
  pkgs,
  userSettings,
  ...
}: {
  home.packages = with pkgs; [
    rofi-wayland
    discord
    hyprpaper
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      exec-once = [
        "hyprpaper &"
        "$HOME/pick_random_wallpaper.sh"
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "HDMI-A-1, 1920x1080@60, 1920x0, 1"
      ];

      "$mod" = "SUPER";

      bind =
        [
          "$mod, B, exec, firefox"
          "$mod SHIFT, Return, exec, ${userSettings.terminal}"
          "$mod, V, exec, code"
          "$mod SHIFT, Q, killactive"
          "$mod SHIFT, E, exit"
          "$mod, P, exec, rofi -show drun"
          "$mod, O, exec, $HOME/pick_random_wallpaper.sh"
          "$mod, F, fullscreen"
          "$mod, D, exec, discord"
        ]
        ++ (
          # i just took this from the hyprland wiki and it works so i guess??
          # ok i think i understand this code now
          builtins.concatLists (builtins.genList (
              i: let
                workspace = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString workspace}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString workspace}"
              ]
            )
            9) # from 0 to 9 (10 workspaces)
        );

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };
}
