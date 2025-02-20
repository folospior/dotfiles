{userSettings, ...}: {
  programs.adb.enable = true;
  users.users.${userSettings.username}.extraGroups = ["adbusers"];
}
