{
  self,
  userSettings,
  systemSettings,
  ...
}: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "nord";
      editor = {
        line-number = "relative";
        scroll-lines = 2;
        bufferline = "always";
        rulers = [80];
        clipboard-provider = "wayland";
        statusline = {
          left = ["mode" "file-name" "file-modification-indicator"];
          center = ["diagnostics" "read-only-indicator"];
          right = ["register" "version-control" "position"];
        };
        lsp = {
          display-inlay-hints = true;
        };
        cursor-shape.insert = "underline";
        file-picker = {
          hidden = false; # false -> show hidden files
        };
        auto-save = {
          focus-lost = true;
          "after-delay.enable" = true;
          "after-delay.timeout" = 1000;
        };
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "info";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          language-servers = ["nixd"];
          formatter = {
            command = "alejandra";
          };
        }
      ];
      language-server.nixd = {
        config = let
          flake = "(builtins.getFlake \"${self}\");";
        in {
          nixos.expr = "${flake}.nixosConfigurations.\"${systemSettings.hostname}\".options";
          home_manager.expr = "${flake}.homeConfigurations.\"${userSettings.username}\".options";
        };
      };
    };
  };
}
