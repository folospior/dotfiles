{
  self,
  lib,
  pkgs,
  systemSettings,
  userSettings,
  ...
}: {
  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      ignorecase = true;
      smartcase = true;
      tabstop = 2;
      undofile = true;
    };
    colorschemes.nord.enable = true;
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          nixd = let
            flake = ''(builtins.getFlake "${self}")'';
          in {
            enable = true;
            settings = {
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              formatting.command = ["${lib.getExe pkgs.alejandra}"];
              options = {
                nixos.expr = "${flake}.nixosConfigurations.${systemSettings.hostname}.options";
                home-manager.expr = "${flake}.nixosConfigurations.${userSettings.username}.options";
              };
            };
          };
          gopls.enable = true;
          gleam.enable = true;
          cssls.enable = true;
          html = {
            enable = true;
            filetypes = ["html" "templ"];
          };
          emmet_ls = {
            enable = true;
            filetypes = ["html" "templ"];
          };
          htmx = {
            enable = true;
            filetypes = ["html" "templ"];
          };
          tailwindcss = {
            enable = true;
            filetypes = ["html" "templ"];
            settings.tailwindCSS.includeLanguages = {
              templ = "html";
            };
          };
          templ.enable = true;
          zls.enable = true;
        };
      };

      lsp-format.enable = true; #formatting
      lsp-lines.enable = true; #multiple lines for errors
      lsp-signature.enable = true; #show function signature
      lsp-status.enable = true; #more things at the lualine
      lspkind.enable = true; #pictograms
      neocord.enable = true; #discord
      lualine.enable = true; #bottom status line
      web-devicons.enable = true; #icons
      treesitter.enable = true;
      bufferline.enable = true;
      telescope.enable = true;
      cmp = {
        enable = true;
        settings = {
          sources = [
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
          ];
          keymaps = {
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.select_next_item()";
            "<S-Tab>" = "cmp.select_prev_item()";
          };
        };
      };
      dressing.enable = true;
    };
  };
}
