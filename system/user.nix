{userSettings, ...}: {
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.fullName;
    extraGroups = userSettings.groups;
  };
}