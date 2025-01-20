{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./rofi.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper # using the hyprpaper service does not work :(
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = "";

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

      input.kb_layout = systemSettings.kbLayout;

      general = {
        "col.inactive_border" = "rgb(3b4252) rgb(2e3440) 45deg";
        "col.active_border" = "rgb(4c566a) rgb(434c5e) 45deg";
        gaps_out = 20;
        border_size = 2;
      };

      decoration = {
        rounding = 12;
        shadow.range = 6;
      };

      bezier = [
        "easeInOutCirc, 0.85, 0, 0.15, 1"
        "easeInOutQuint, 0.83, 0, 0.17, 1"
        "easeOutExpo, 0.16, 1, 0.3, 1"
      ];

      animation = [
        "windows, 1, 7, easeInOutCirc, popin"
        "workspaces, 1, 5, easeInOutQuint, slidevert"
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
          ", Print, exec, grimblast copysave area"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          "$mod, Space, togglefloating"
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"
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
