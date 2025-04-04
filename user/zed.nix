{
  self,
  systemSettings,
  userSettings,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "nord"
      "nix"
      "gleam"
      "templ"
      "discord-presence"
    ];
    userSettings = {
      vim_mode = true;
      autosave.afterDelay.milliseconds = 1000;
      buffer_font_family = "JetBrains Mono";
      buffer_font_size = 16;
      ui_font_family = "Ubuntu";

      lsp = {
        nixd.settings = let
          flake = "(builtins.getFlake \"${self}\");";
        in {
          nixos.expr = "${flake}.nixosConfigurations.\"${systemSettings.hostname}\".options";
          home_manager.expr = "${flake}.homeConfigurations.\"${userSettings.username}\".options";
        };
      };

      languages = {
        Nix.formatter.external.command = "alejandra";
      };

      theme = {
        mode = "dark";
        dark = "Nord";
      };
    };
  };
}
