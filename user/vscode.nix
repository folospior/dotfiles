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
      jdinhlife.gruvbox
      gleam.gleam
      ms-dotnettools.csdevkit
      ms-python.python
      ms-vscode.cpptools
      ms-vscode.cmake-tools
      rust-lang.rust-analyzer
      golang.go
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
        };

        "options" = {
          "nixos" = {
            "expr" = "(builtins.getFlake \"/home/${userSettings.username}/nixos2\").nixosConfigurations.${systemSettings.hostname}.options";
          };
          "home_manager" = {
            "expr" = "(builtins.getFlake \"/home/${userSettings.username}/nixos2\").homeConfigurations.\"${userSettings.username}\".options";
          };
        };
      };

      "editor.formatOnSave" = true;
      "files.autoSave" = "afterDelay";
      "workbench.colorTheme" = "Gruvbox Dark Medium";
      "editor.cursorStyle" = "underline";
      "editor.cursorBlinking" = "smooth";
      "editor.fontFamily" = "JetBrains Mono";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 15;
      "terminal.integrated.fontFamily" = "JetBrains Mono";
      "terminal.integrated.cursorStyle" = "underline";
      "terminal.integrated.cursorBlinking" = true;
    };
  };
}
