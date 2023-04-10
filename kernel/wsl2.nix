{ pkgs, binPath }:
let
  meta = import ../meta.nix;
in
{
  symlinks = {
  };

  bashConfig = ''
  if [[ ! -d ${binPath} ]]
  then
    mkdir -p ${binPath}
  fi
  if ! type 'xdg-open' > /dev/null; then
    ln -s $(which wslview) ${binPath}/xdg-open
  fi
  '';

  packages = [
    pkgs.wslu
  ];
}
