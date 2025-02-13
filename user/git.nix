{userSettings, ...}: {
  programs.git = {
    enable = true;
    userName = userSettings.fullName;
    userEmail = userSettings.email;
    signing = {
      key = "B5F244BAF8842036";
      signByDefault = true;
    };
    extraConfig = {
      core.editor = "nvim";
    };
  };
  programs.gh.enable = true;
}
