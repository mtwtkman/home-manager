{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
import
  (fetchFromGitHub {
    owner = "mtwtkman";
    repo = "pura";
    rev = "HEAD";
    sha256 = "0jj8rdjkp017glni8h54wffylsf5dp35p1qpcg3cw2f6aqfy9vcd";
  })
{ }
