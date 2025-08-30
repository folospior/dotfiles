{systemSettings, ...}: {
  services.xserver = {
    enable = true;
    videoDrivers = systemSettings.videoDrivers;
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}