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
	autoEnableSources = true;
	settings = { 
	  sources = [
	    { name = "nvim_lsp"; }
	  ];
	  mapping = {
	    "<C-Space>" = "cmp.mapping.complete()";
	    "<C-e>" = "cmp.mapping.close()";
	    "<C-f>" = "cmp.mapping.scroll_docs(4)";
	    "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	    "<CR>" = "cmp.mapping.confirm({ select = true })";
	  };
	};
      } ;
      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          #	  rust-analyzer.enable = true;
          clangd.enable = true;
          csharp_ls.enable = true;
	  gopls.enable = true;
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
