{systemSettings, ...}: {
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    prime = {
      intelBusId = systemSettings.iGPUBusId;
      nvidiaBusId = systemSettings.dGPUBusId;
      sync.enable = true;
    };
  };
}
