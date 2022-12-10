let pkgs = import <nixpkgs> { };
in rec {
  username = builtins.getEnv "USER";
  home = "/home/${username}";
  homeManagerStateVersion = "22.05";
  system = pkgs.system;
}
