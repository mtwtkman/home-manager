let
  meta = import ../meta.nix;
in {
  ll = "ls -alF";
  la = "ls -A";
  l = "ls -CF";
  rm = "trash-put";
  hm = "NIXPKGS_ALLOW_UNFREE=1 home-manager --impure";
  hmc = "hm expire-generations 1s; nix profile wipe-history";
  hms = "hm switch";
  hmup = "pushd ${meta.homeManagerDirectory}; flake update; hms; hmc; popd";
  flake = "nix flake";
  dev = "nix develop";
  vim = "nvim --listen /tmp/nvimsocket";
  v = "vim";
  vr = "nvr -c 'set number'";
  vrv = "vr -cc vsplit --remote-wait";
  vrh = "vr -cc split --remote-wait";
  nixsearch = "nix-env -f '<nixpkgs>' -qaPA";
  ns = "nix-shell";
  pura = "pura -r ${meta.homeManagerDirectory}/pura";
  devshell = "nix flake new -t \"github:numtide/devshell\"";
  vsh = "vim term://bash";
}
