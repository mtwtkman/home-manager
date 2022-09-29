let pkgs = import <nixpkgs> { };
in rec {
  username = "mtwtkman";
  home = "/home/${username}";
  homeManagerStateVersion = "22.05";
  system = pkgs.system;
}
