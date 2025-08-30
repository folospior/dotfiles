{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland --remember --remember-session --asterisks --window-padding 2 --power-shutdown 'systemctl poweroff' --power-reboot 'systemctl reboot' --greeting 'Welcome to Folo-Nix. Log in below.' --kb-command 2 --kb-sessions 3 --kb-power 4";
      user = "greeter";
    };
  };
}
