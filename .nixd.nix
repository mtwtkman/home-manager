# nix eval --json --file .nixd.nix > .nixd.json
let
  meta = import ./meta.nix;
in
{
  options = {
    enable = true;
    target = {
      args = [ ];
      installable = ".#homeConfigurations.${meta.username}.options";
    };
  };
}
