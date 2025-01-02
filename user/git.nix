{userSettings, ...}: {
  programs.git = {
    enable = true;
    userName = userSettings.fullName;
    userEmail = userSettings.email;
    extraConfig = {
    	core.editor = "nvim";
    };
  };
  programs.gh.enable = true;
}
