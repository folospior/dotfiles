{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      gleam.gleam
      ms-dotnettools.csdevkit
      ms-python.python
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      rust-lang.rust-analyzer
      golang.go
      arcticicestudio.nord-visual-studio-code
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
      "window.titleBarStyke" = "custom";
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "terminal.integrated.cursorStyle" = "underline";
      "terminal.integrated.cursorBlinking" = true;
    };
  };
}
