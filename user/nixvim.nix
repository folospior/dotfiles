{...}: {
  programs.nixvim = {
    enable = true;

    globalOpts = {
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
          nixd.enable = true;
          gopls.enable = true;
          gleam.enable = true;
          cssls.enable = true;
          html = {
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
      cmp.enable = true;
    };
  };
}
