{pkgs, ...}: {
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    sshKeys = ["2FF2BC110EEEEF8E569815ABD6AD80451B41E046"];
    pinentryPackage = pkgs.pinentry-tty;
  };
}
