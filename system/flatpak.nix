{...}: {
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "org.vinegarhq.Sober"
      "com.obsproject.Studio" # only the flatpak is the supported way of installing obs studio
      "com.usebottles.bottles"
    ];
    overrides = {
      "org.vinegarhq.Sober" = {
        Context = {
          filesystems = ["xdg-run/discord-ipc-0" "xdg-run/app/com.discordapp.Discord:create"];
        };
        Environment = {
          # do not touch, makes sober run on the iGPU and not crash lol
          VK_DRIVER_FILES = "/usr/lib/x86_64-linux-gnu/GL/vulkan/icd.d/intel_icd.x86_64.json";
        };
      };
      "com.usebottles.bottles".Context.filesystems = ["home"];
    };
  };
}
