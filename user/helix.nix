{
  self,
  userSettings,
  systemSettings,
  ...
}: {
  home.shellAliases = {
    "nvim" = "hx";
    "vim" = "hx";
    "vi" = "hx";
    "v" = "hx";
    "nano" = "hx";
  };
  programs.helix = {
    enable = true;
    settings = {
      # theme = "nord";
      editor = {
        mouse = false;
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
          hidden = true; # false -> show hidden files
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
