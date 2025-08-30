{pkgs, userSettings, ...}: {
  programs.git = {
    enable = true;
    userName = userSettings.fullName;
    userEmail = userSettings.email;
    signing = {
      key = "B5F244BAF8842036";
      signByDefault = true;
    };
    extraConfig = {
      core.editor = "hx";
    };
  };
  programs.gh.enable = true;
  programs.gh.extensions = [pkgs.gh-copilot];
}
