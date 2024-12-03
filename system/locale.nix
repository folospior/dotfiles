{systemSettings, ...}: {

  time.timeZone = systemSettings.timezone;

  i18n.defaultLocale = systemSettings.language;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.country;
    LC_IDENTIFICATION = systemSettings.country;
    LC_MEASUREMENT = systemSettings.country;
    LC_MONETARY = systemSettings.country;
    LC_NAME = systemSettings.country;
    LC_NUMERIC = systemSettings.country;
    LC_PAPER = systemSettings.country;
    LC_TELEPHONE = systemSettings.country;
    LC_TIME = systemSettings.country;
  };

  console.keyMap = systemSettings.kbLayout;
  services.xserver.xkb.layout = systemSettings.kbLayout;
}