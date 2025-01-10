{
  pkgs,
  systemSettings,
  userSettings,
  ...
}: let
  custom-css-and-js = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vscode-custom-css";
      publisher = "be5invis";
      version = "7.4.0";
      sha256 = "0psgyyq4ww20lh668z6p44fyj1vcw21chlqzlmd319pb6ck82ld5";
    };
  };

  vscode-animations = pkgs.vscode-utils.buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vscode-animations";
      publisher = "BrandonKirbyson";
      version = "2.0.7";
      sha256 = "13whqqlv46mngg94pyy87s11im3ixb1rf4ngdd8jhk4znvbqph2d";
    };
  };
in {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions;
      [
        arcticicestudio.nord-visual-studio-code
        gleam.gleam
        golang.go
        jnoortheen.nix-ide
        mkhl.direnv
        ms-dotnettools.csdevkit
        ms-python.python
        ms-vscode.cmake-tools
        ms-vscode.cpptools
        rust-lang.rust-analyzer # i dont even write rust why is this here
      ]
      ++ [
        vscode-animations
        custom-css-and-js
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
