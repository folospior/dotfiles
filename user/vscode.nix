{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      arcticicestudio.nord-visual-studio-code
      gleam.gleam
      golang.go
      jnoortheen.nix-ide
      ms-dotnettools.csdevkit
      ms-python.python      ms-vscode.cmake-tools
      ms-vscode.cpptools
      rust-lang.rust-analyzer
    ];
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
      "workbench.colorTheme" = "Nord";
      "editor.cursorStyle" = "underline";
      "editor.cursorBlinking" = "smooth";
      "editor.fontFamily" = "JetBrains Mono";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 15;
      "window.titleBarStyle" = "custom";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.cursorStyle" = "underline";
      "terminal.integrated.cursorBlinking" = true;
    };
  };
}
