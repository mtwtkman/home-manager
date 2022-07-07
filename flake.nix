{
  description = "My home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      meta = import ./meta.nix;
      system = meta.system;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.${meta.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
        ./home.nix
        ];
      };
    };
}
