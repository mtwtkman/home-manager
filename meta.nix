let pkgs = import <nixpkgs> { };
in
rec {
  username = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
  homeManagerStateVersion = "22.05";
  system = pkgs.system;
  homeManagerDirectory = "${home}/.config/home-manager";
}
