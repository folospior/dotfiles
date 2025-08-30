{systemSettings, ...}: {
  networking = {
    networkmanager.enable = true;
    hostName = systemSettings.hostname;
  };
}
