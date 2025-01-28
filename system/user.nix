{userSettings, pkgs, ...}: {
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.fullName;
    extraGroups = userSettings.groups;
    shell = pkgs.zsh;
  };
}
