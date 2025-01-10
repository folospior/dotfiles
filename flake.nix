{
  description = "Folo's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    nixvim,
    spicetify-nix,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}; # required for home-manager
    spicetifyPkgs = spicetify-nix.legacyPackages.${system};

    systemSettings = {
      inherit system;
      hostname = "Folo-Nix";
      language = "de_DE.UTF-8";
      country = "pl_PL.UTF-8";
      kbLayout = "pl";
      timezone = "Europe/Warsaw";
      videoDrivers = ["nvidia"];
      displayManager = "sddm"; # one of sddm, none
      iGPUBusId = "PCI:0:2:0";
      dGPUBusId = "PCI:1:0:0";
      desktop = "hyprland"; # one of plasma, hyprland, none
    };
    userSettings = {
      username = "folo";
      fullName = "Filip Hoffmann";
      email = "folosp2@gmail.com";
      groups = ["networkmanager" "wheel"];
      browser = "firefox"; # one of firefox, none
      terminal = "kitty"; # one of alacritty, kitty, ghostty, none
    };
  in {
    nixosConfigurations = {
      ${systemSettings.hostname} = lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };

        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./system/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      ${userSettings.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
          inherit spicetifyPkgs;
        };
        modules = [
          nixvim.homeManagerModules.nixvim
          spicetify-nix.homeManagerModules.default
          ./user/home.nix
        ];
      };
    };
  };
}
