{
  pkgs,
  systemSettings,
  ...
}: let
  nvidia =
    if builtins.elem "nvidia" systemSettings.videoDrivers
    then ./nvidia.nix
    else ./none.nix;
in {
  imports = [
    ./adb.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./cloudflare-zero-trust.nix
    ./docker.nix
    ./flatpak.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./locate.nix
    ./networking.nix
    ./nix.nix
    ./postgresql.nix
    ./qemu.nix
    ./sound.nix
    ./swap.nix
    ./user.nix
    ./wireshark.nix
    ./xserver.nix
    ./zsh.nix

    nvidia
    ./${systemSettings.displayManager}.nix
    ./${systemSettings.desktop}.nix
  ];

  # Allow unfree packages

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    alejandra
    nixd
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
