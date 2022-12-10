#!/bin/sh

config_path="${HOME}/.config"

echo "arrange the config directory"
[ ! -d "${config_path}" ] && mkdir ${config_path}

echo 'install nix'
# ref: https://nixos.org/download.html
curl -L https://nixos.org/nix/install | sh

. $HOME/.nix-profile/etc/profile.d/nix.sh

echo 'install home-manager'
# ref: https://nix-community.github.io/home-manager/index.html#sec-install-standalone
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

echo 'install repo'
rm -rf ${config_path}/nixpkgs
nix-shell -p git --run "git clone git@github.com:mtwtkman/home-manager ${config_path}/nixpkgs"

echo 'activate home-manager'
NIX_CONF_DIR=~/.config/nixpkgs home-manager --impure switch

echo 'done'
