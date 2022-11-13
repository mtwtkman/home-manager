{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
import
  (fetchFromGitHub {
    owner = "mtwtkman";
    repo = "pura";
    rev = "HEAD";
    sha256 = "1q91idg3a6ms3xnnr93qk5sia0v1n7xpx8n5y3g3zk5k8a3jpgif";
  })
{ }
