{
  userSettings,
  systemSettings,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      startPlugins = ["dressing-nvim"];
      keymaps = [
        {
          key = "<a-cr>";
          mode = ["n"];
          action = ":lua vim.lsp.buf.code_action()<CR>";
          silent = true;
          desc = "Open code action menu";
        }
      ];
      ui.borders.plugins.lsp-signature.enable = true;
      lsp = {
        lspSignature.enable = true;
        lsplines.enable = true;
        lspkind.enable = true;
        formatOnSave = true;
      };
      undoFile.enable = true;
      searchCase = "smart";
      options.tabstop = 4;

      languages = {
        enableLSP = true;
        enableTreesitter = true;
        enableFormat = true;
        nix = {
          enable = true;
          lsp = {
            server = "nixd";
            options = {
              nixos.expr = "(builtins.getFlake \"/home/${userSettings.username}/dotfiles/\").nixosConfigurations.\"${systemSettings.hostname}\".options";
              home_manager.expr = "(builtins.getFlake \"/home/${userSettings.username}/dotfiles/\").homeConfigurations.\"${userSettings.username}\".options";
            };
          };
        };
        go.enable = true;
        gleam.enable = true;
        css.enable = true;
        zig.enable = true;
      };
      presence.neocord = {
        enable = true;
        setupOpts = {
          enable_line_number = true;
          debounce_timeout = 2;
          logo_tooltip = "Neovim";
        };
      };
      statusline.lualine.enable = true;
      visuals.nvim-web-devicons.enable = true;
      tabline.nvimBufferline.enable = true;
      telescope.enable = true;
      treesitter = {
        enable = true;
        indent.enable = false;
      };
      autocomplete.nvim-cmp.enable = true;
      syntaxHighlighting = true;
      theme = {
        name = "nord";
        enable = true;
        transparent = true;
      };
    };
  };
}
