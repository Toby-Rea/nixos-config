{
  description = "Personal system configuration";
  
  inputs = {
    # Nixpkgs
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.follows = "unstable";
    home-manager.url = "github:nix-community/home-manager";
    
    # Overlays
    emacs.url = "github:nix-community/emacs-overlay";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
  };
  
  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      
      config = { 
        allowUnfree = true;
        allowBroken = true;
      };
      
      overlays = with inputs; [
        emacs.overlay
        nixpkgs-wayland.overlay
      ];
    };
  in {
    #homeManagerConfigurations = {
    #  thinkpad = home-manager.lib.homeManagerConfiguration {
    #    inherit system pkgs;
    #    username = "toby";
    #    stateVersion = "21.05";
    #    homeDirectory = "/home/toby";
    #    configuration = {
    #      imports = [
    #        ./thinkpad/home.nix
    #      ];
    #    };
    #  };
    #};

    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [ 
          ./thinkpad
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.toby = import ./thinkpad/home.nix;
          }
        ];
      };
    };
  };
}
