{ pkgs, binPath }:
{
  symlinks = {
    xdg-open = {
      enable = true;
      executable = true;
      source = "/mnt/c/Windows/explorer.exe"; # FIXME: Use result of `which explorer.exe`.
      target = "${binPath}/xdg-open";
    };
  };

  packages = [
    pkgs.wslu
  ];
}
