{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: let
  discord-vscode = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "discord-vscode";
      publisher = "icrawl";
      version = "5.8.0";
      sha256 = "0r9n2g5rif4y2619wccjqh3pn9rljb3yhblz09pdksmfi2ifakr1";
    };
  };
in {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # gleam.gleam
      # golang.go
      # jnoortheen.nix-ide
      mkhl.direnv
      # ms-dotnettools.csdevkit
      # ms-python.python
      # ms-vscode.cmake-tools
      # ms-vscode.cpptools
      # rust-lang.rust-analyzer # i dont even write rust why is this here
      # github.copilot
      # github.copilot-chat
      llvm-vs-code-extensions.vscode-clangd
      ms-vscode-remote.remote-containers
    ] ++ [discord-vscode];
    userSettings = {
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nix.serverSettings" = {
        "nixpkgs" = {
          "expr" = "import <nixpkgs> { }";
        };

        "nixd" = {
          "formatting" = {
            "command" = ["alejandra"];
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/${userSettings.username}/dotfiles/\").nixosConfigurations.\"${systemSettings.hostname}\".options";
            };
            "home_manager" = {
              "expr" = "(builtins.getFlake \"/home/${userSettings.username}/dotfiles/\").homeConfigurations.\"${userSettings.username}\".options";
            };
          };
        };
      };

      "editor.formatOnSave" = true;
      "files.autoSave" = "afterDelay";
      "editor.cursorStyle" = "underline";
      "editor.cursorBlinking" = "smooth";
      "window.titleBarStyle" = "custom";
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "github.copilot.enable" = {
        "*" = false;
        "plaintext" = false;
        "markdown" = false;
        "scminput" = false;
      };
      "vscode_custom_css.imports" = [""];
    };
  };
}
