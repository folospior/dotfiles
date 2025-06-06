{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    configFile.text = ''
      #!/usr/bin/env nu
      $env.config.buffer_editor = "${pkgs.helix}/bin/hx"
      $env.config.show_banner = false
    '';
  };
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };
}
