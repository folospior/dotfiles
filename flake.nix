{
  description = "Folo's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cidbot = {
      url = "git+ssh://git@github.com/folospior/cidbot-test-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    spicetify-nix,
    nvf,
    cidbot,
    nixvim,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}; # required for home-manager
    spicetifyPkgs = spicetify-nix.legacyPackages.${system};

    systemSettings = {
      inherit system;
      hostname = "Folo-Nix";
      language = "en_US.UTF-8";
      country = "pl_PL.UTF-8";
      kbLayout = "pl";
      timezone = "Europe/Warsaw";
      videoDrivers = ["nvidia"];
      displayManager = "greetd"; # one of sddm, greetd, none
      iGPUBusId = "PCI:0:2:0";
      dGPUBusId = "PCI:1:0:0";
      desktop = "hyprland"; # one of plasma, hyprland, none
    };
    userSettings = {
      username = "folo";
      fullName = "Filip Hoffmann";
      email = "folosp@protonmail.com";
      groups = ["networkmanager" "wheel" "wireshark"];
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
          inherit self;
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
          inherit spicetifyPkgs;
        };
        modules = [
          nvf.homeManagerModules.default
          cidbot.homeManagerModules.default
          spicetify-nix.homeManagerModules.default
          nixvim.homeManagerModules.nixvim
          ./user/home.nix
        ];
      };
    };
  };
}
