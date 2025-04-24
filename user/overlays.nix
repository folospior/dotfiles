{pkgsMaster, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      qt6Packages = prev.qt6Packages.overrideScope (_: kprev: {
        qt6gtk2 = pkgsMaster.qt6Packages.qt6gtk2;
      });
    })
  ];
}
