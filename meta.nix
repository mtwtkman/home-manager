let
  pkgs = import <nixpkgs> { };
  kernelVersionFile = "/proc/sys/kernel/osrelease";
in
rec {
  username = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
  homeManagerStateVersion = "23.11";
  system = pkgs.system;
  homeManagerDirectory = "${home}/.config/home-manager";
  localBinPath = "${home}/.local/bin";
  isWsl2 =
    if builtins.pathExists kernelVersionFile
    then pkgs.lib.strings.hasInfix "wsl2" (pkgs.lib.strings.toLower (builtins.readFile kernelVersionFile))
    else false;
}
