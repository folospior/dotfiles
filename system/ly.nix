{...}: {
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      bigclock = "en";
      clock = "%x";
    };
  };
}
