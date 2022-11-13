{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
import (fetchFromGitHub {
  owner = "mtwtkman";
  repo = "pura";
  rev = "HEAD";
})
