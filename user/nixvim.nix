{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.nord.enable = true;
    plugins = {
      web-devicons.enable = true;
      bufferline.enable = true;
      lualine.enable = true;
      lsp = {
        enable = true;
	servers = {
	  lua_ls.enable = true;
#	  rust-analyzer.enable = true;
	  clangd.enable = true;
	  csharp_ls.enable = true;
          nixd.enable = true;
	};
      };
    };
  };
}
