{userSettings, ...}: {
  programs.git = {
    enable = true;
    userName = userSettings.fullName;
    userEmail = userSettings.email;
  };
  programs.gh.enable = true;
}
