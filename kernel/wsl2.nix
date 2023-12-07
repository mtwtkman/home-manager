{ pkgs, binPath }:
{
  symlinks = { };

  bashConfig = ''
    if [[ ! -d ${binPath} ]]
    then
      mkdir -p ${binPath}
    fi
  '';

  packages = [
    pkgs.wslu
  ];
}
