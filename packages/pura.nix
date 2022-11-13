{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
import (fetchFromGitHub {
  owner = "mtwtkman";
  repo = "pura";
  rev = "HEAD";
  sha256 = "Lr4rh0KzzD/e8MWifvuxYQMVdZl4pGxtH7oaNV6LIeE=";
})
