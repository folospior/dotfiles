{...}: {
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      {
        flatpakref = "https://sober.vinegarhq.org/sober.flatpakref";
        sha256 = "1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
      }
      "com.obsproject.Studio" # only the flatpak is the supported way of installing obs studio
      "com.usebottles.bottles"
    ];
    overrides = {
      "org.vinegarhq.Sober".Environment = {
        # do not touch, makes sober run on the iGPU and not crash lol
        VK_DRIVER_FILES = "/usr/lib/x86_64-linux-gnu/GL/vulkan/icd.d/intel_icd.x86_64.json";
      };
      "com.usebottles.bottles".Context.filesystems = [ "home" ];
    };
  };
}
