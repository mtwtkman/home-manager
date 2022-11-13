{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
import
  (fetchFromGitHub {
    owner = "mtwtkman";
    repo = "pura";
    rev = "HEAD";
    sha256 = "1kfckla6znzivag9l5hhaqhb664zy501w47h4xlg1gjqzx8j0dfz";
  })
{ }
