{ nixpkgs ? import <nixpkgs> { } }:
[
  (import ./pura.nix { nixpkgs = nixpkgs; })
  (import (fetchTarball "https://install.devenv.sh/latest"))
]
