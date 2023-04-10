{ pkgs, binPath }:
let
  meta = import ../meta.nix;
in
{
  symlinks = {
  };

  bashConfig = ''
  mkdir $HOME/.local/bin
  ln -s $(which wslview) ${binPath}/xdg-open
  '';

  packages = [
    pkgs.wslu
  ];
}
