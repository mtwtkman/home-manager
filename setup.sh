#!/bin/sh

config_path="${HOME}/.config"
nix_dir="${config_path}/nix"
my_home_manager_path="${config_path}/home-manager"

echo "arrange the config directory"
[ ! -d "${config_path}" ] && mkdir ${config_path}

echo "arrange the nix directory"
[ ! -d "${nix_dir}" ] && mkdir ${nix_dir}

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
rm -rf ${my_home_manager_path}
nix-shell -p git --run "git clone git@github.com/mtwtkman/home-manager ${my_home_manager_path}"

echo 'link nix.conf'
nix_conf="nix.conf"
ln ${my_home_manager_path}/${nix_conf} ${nix_dir}/${nix_conf}

echo 'activate home-manager'
nix-shell -p git --run "NIX_HOME_MANAGER_ROOT=${my_home_manager_path} home-manager --impure switch"

echo 'done'
