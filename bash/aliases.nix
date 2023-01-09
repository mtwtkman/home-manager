{
  ll = "ls -alF";
  la = "ls -A";
  l = "ls -CF";
  rm = "trash-put";
  hm = "NIXPKGS_ALLOW_UNFREE=1 home-manager --impure";
  update = "sudo apt update && sudo apt upgrade -y && sudo apt autoremove";
  flake = "nix flake";
  hf = "history | fzf";
  dev = "nix develop";
  vim = "nvim --listen /tmp/nvimsocket";
  v = "vim";
  vr = "nvr -c 'set number'";
  vrv = "vr -cc vsplit --remote-wait";
  vrh = "vr -cc split --remote-wait";
  nixsearch = "nix-env -f '<nixpkgs>' -qaP";
  ns = "nix-shell";
  pura = "pura -r ~/.config/nixpkgs/pura";
  devshell = "nix flake new -t \"github:numtide/devshell\"";
  vsh = "vim term://bash";
}
