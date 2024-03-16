#!/bin/sh

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

function pp() {
  color=$1
  msg=$2
  echo -e "${color}[setup.sh]${msg}${NC}"
}

function info() {
  pp $BLUE $1
}

function alert() {
  pp $RED $1
}

config_path="${HOME}/.config"
nix_dir="${config_path}/nix"
my_home_manager_path="${config_path}/home-manager"

if [ "$#" -eq 0 ]; then
  info "Please pass argument to detect kernel"
  exit 0
fi

kernel_label="$1"

shift
kernel_label_file="${my_home_manager_path}/.kernel"
info "created ${kernel_label_file}"
echo $kernel_label > $kernel_label_file

if [ ! -d "${config_path}" ]; then
  info "create ${config_path}"
  mkdir ${config_path}
fi

if [ ! -d "${nix_dir}" ]; then
  info "create ${nix_dir}"
  mkdir ${nix_dir}
fi

info 'install nix'
# ref: https://nixos.org/download.html
curl -L https://nixos.org/nix/install | sh

. $HOME/.nix-profile/etc/profile.d/nix.sh

info 'install home-manager'
# ref: https://nix-community.github.io/home-manager/index.html#sec-install-standalone
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

info 'install repo'
rm -rf ${my_home_manager_path}
nix-shell -p git --run "git clone git@github.com:mtwtkman/home-manager ${my_home_manager_path}"

nix_conf="nix.conf"
if [ ! -e ${nix_dir}/${nix_conf}  ]; then
  info "remove obsolete symlink"
  rm ${nix_dir}/${nix_conf}
fi
info 'link nix.conf'
ln ${my_home_manager_path}/${nix_conf} ${nix_dir}/${nix_conf}

info 'activate home-manager'
nix-shell -p git --run "NIX_HOME_MANAGER_ROOT=${my_home_manager_path} home-manager --impure switch"


info 'done'
