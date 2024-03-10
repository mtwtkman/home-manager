let
  pkgs = import <nixpkgs> { };
in
rec {
  username = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
  homeManagerStateVersion = "23.11";
  system = pkgs.system;
  homeManagerDirectory = "${home}/.config/home-manager";
  kernelVersionFile = "${homeManagerDirectory}/.kernel";
  localBinPath = "${home}/.local/bin";
  isWsl2 = builtins.readFile kernelVersionFile == "wsl2";
}
