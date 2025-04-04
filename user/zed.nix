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
      "emmet"
      "nord"
      "nix"
      "gleam"
      "templ"
    ];
    userSettings = {
      vim_mode = true;
      autosave.after_delay.milliseconds = 1000;
      buffer_font_family = "JetBrains Mono";
      buffer_font_size = 16;
      ui_font_family = "Ubuntu";
      load_direnv = "shell_hook";
      tabs = {
        file_icons = true;
        git_status = true;
        show_diagnostics = "all";
      };

      lsp = {
        nixd = {
          binary.path_lookup = true;
          settings = let
            flake = "(builtins.getFlake \"${self}\");";
          in {
            nixos.expr = "${flake}.nixosConfigurations.\"${systemSettings.hostname}\".options";
            home_manager.expr = "${flake}.homeConfigurations.\"${userSettings.username}\".options";
          };
        };
        gopls.binary.path_lookup = true;
        gleam.binary.path_lookup = true;
        html.binary.path_lookup = true;
        emmet.binary.path_lookup = true;
        templ.binary.path_lookup = true;
        clangd.binary.path_lookup = true;
      };

      languages = {
        Nix = {
          formatter.external.command = "alejandra";
          language_servers = ["nixd" "!nil"];
        };
      };

      theme = {
        mode = "dark";
        dark = "Nord";
        light = "One Light";
      };
    };
  };
}
