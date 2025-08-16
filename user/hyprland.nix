{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: let
  backgrounds = pkgs.fetchFromGitHub {
    owner = "justchokingaround";
    repo = "wallpapers";
    rev = "aa9ad55543218fa03692b96f679b8ccfc067f1a6";
    hash = "sha256-+A8sBYnBUlg5okCjyi1mufcC0/aymQBrcN77naLOIgk=";
  };

   bgScript = pkgs.writeShellScriptBin "backgrounds" ''
     #!/bin/sh

     # waits for hyprpaper to initialize
     sleep 0.5s

     wallpaper="${backgrounds}/gangsta-crip-6ix9ine-ohio-rapper-oxocarbon.png"
     loaded_output=$(${pkgs.hyprland}/bin/hyprctl hyprpaper listloaded)
     echo $wallpaper > $HOME/wallpaper.txt
     if [[ $loaded_output != "no wallpapers loaded" ]]; then
     	${pkgs.hyprland}/bin/hyprctl hyprpaper unload all
     fi
     ${pkgs.hyprland}/bin/hyprctl hyprpaper preload $wallpaper
     wall_with_monitor=",''${wallpaper}"
     ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper $wall_with_monitor
   '';
  
  # bgScript = pkgs.writeShellScriptBin "backgrounds" ''
  #     #!/usr/bin/env nu

  #     def 'random choice' []: list -> any {
  #       $in | get (random int 0..<($in | length))
  #     }
      
  #     sleep 0.5sec

  #     let wallpapers = [
  #       "blockwavemoon.png",
  #       "leafy.png",
  #       "moon.jpg",
  #       "rose_pine_countourline.png",
  #       "rose_pine_maze.png",
  #       "rose_pine_noiseline.png",
  #       "rose_pine_shape.png"
  #     ] | each { |wall| "${backgrounds}/" + $wall }

  #     let wallpaper = wallpapers | random choice

  #     if ${pkgs.hyprland}/bin/hyprctl hyprpaper listloaded != "no wallpapers loaded" {
  #       ${pkgs.hyprland}/bin/hyprctl hyprpaper unload all
  #     }

  #     ${pkgs.hyprland}/bin/hyprctl hyprpaper preload $wallpaper
  #     ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper "," + $wallpaper
  #   '';

    
in {
  imports = [
    ./rofi.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper # using the hyprpaper service does not work :(
    bgScript
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = "";

  wayland.windowManager.hyprland = {
    enable = true;

    systemd.enable = false;
    settings = {
      exec-once = [
        "hyprpaper &"
        "wl-paste --watch cliphist store"
        "backgrounds"
      ];

      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
        "HDMI-A-1, 1920x1080@60, 1920x0, 1"
      ];

      input = {
        kb_layout = systemSettings.kbLayout;
        kb_options = "compose:rctrl";
      };

      general = {
        # "col.inactive_border" = "rgb(3b4252) rgb(2e3440) 45deg";
        # "col.active_border" = "rgb(4c566a) rgb(434c5e) 45deg";
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

      ecosystem.no_update_news = true;

      bind =
        [
          "$mod, B, exec, firefox"
          "$mod SHIFT, Return, exec, ${userSettings.terminal}"
          "$mod SHIFT, Q, killactive"
          "$mod SHIFT, E, exit"
          "$mod, P, exec, rofi -show drun"
          "$mod, period, exec, rofi -show emoji"
          "$mod, O, exec, backgrounds"
          "$mod, F, fullscreen"
          "$mod, D, exec, discord"
          "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          ", Print, exec, grimblast --freeze copysave area"
          "$mod, Print, exec, grimblast --freeze copysave active"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
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
