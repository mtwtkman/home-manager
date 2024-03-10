#!/bin/sh
BLUE='\033[0;34m'
NC='\033[0m'

config_path="${HOME}/.config"
nix_dir="${config_path}/nix"
my_home_manager_path="${config_path}/home-manager"

function pp() {
  echo -e "${BLUE}[setup.sh] ${1}${NC}"
}

if [ ! -d "${config_path}" ]; then
  pp "create ${config_path}"
  mkdir ${config_path}
fi

if [ ! -d "${nix_dir}" ]; then
  pp "create ${nix_dir}"
  mkdir ${nix_dir}
fi

pp 'install nix'
# ref: https://nixos.org/download.html
curl -L https://nixos.org/nix/install | sh

. $HOME/.nix-profile/etc/profile.d/nix.sh

pp 'install home-manager'
# ref: https://nix-community.github.io/home-manager/index.html#sec-install-standalone
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

pp 'install repo'
rm -rf ${my_home_manager_path}
nix-shell -p git --run "git clone git@github.com:mtwtkman/home-manager ${my_home_manager_path}"

nix_conf="nix.conf"
if [ ! -e ${nix_dir}/${nix_conf}  ]; then
  pp "remove obsolete symlink"
  rm ${nix_dir}/${nix_conf}
fi
pp 'link nix.conf'
ln ${my_home_manager_path}/${nix_conf} ${nix_dir}/${nix_conf}

pp 'activate home-manager'
nix-shell -p git --run "NIX_HOME_MANAGER_ROOT=${my_home_manager_path} home-manager --impure switch"

pp "created ${my_home_manager_path}/.kernel to detect current kernel"
touch ${my_home_manager_path}/.kernel

pp 'done'
