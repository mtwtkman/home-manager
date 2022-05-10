{
  description = "My home-manager configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { home-manager, ... }:
    let
      meta = import ./meta.nix;
    in {
      homeConfigurations.${meta.username} = home-manager.lib.homeManagerConfiguration {
        configuration = import ./home.nix;
        system = meta.system;
        username = meta.username;
        homeDirectory = meta.home;
        stateVersion = meta.homeManagerStateVersion;
      };
    };
}
