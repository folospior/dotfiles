{
  userSettings,
  systemSettings,
  ...
}: {
  programs.nixvim = {
    enable = true;
    colorschemes.nord.enable = true;
    plugins = {
      web-devicons.enable = true;
      bufferline.enable = true;
      lualine.enable = true;
      lsp-format.enable = true;
      cmp = {
      			enable = true;
      } ;
      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          #	  rust-analyzer.enable = true;
          clangd.enable = true;
          csharp_ls.enable = true;
          nixd = {
            enable = true;
            extraOptions = {
              nixpkgs.expr = "import <nixpkgs> { }";
              formatting.command = ["alejandra"];
              options = {
                nixos.expr = "(builtins.getFlake \"/home/${userSettings.username}/dotfiles/\").nixosConfigurations.\"${systemSettings.hostname}\".options";
                home_manager.expr = "(builtins.getFlake \"/home/${userSettings.username}/dotfiles/\").homeConfigurations.\"${userSettings.username}\".options";
              };
            };
          };
        };
      };
    };
  };
}
