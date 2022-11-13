{ config, pkgs, ... }:
let
  meta = import ./meta.nix;
  pura = import ./packages/pura.nix { nixpkgs = pkgs; };
in
{
  home.username = meta.username;
  home.homeDirectory = meta.home;
  home.stateVersion = meta.homeManagerStateVersion;
  home.sessionVariables = { NIX_CONF_DIR = "$HOME/.config/nixpkgs"; };
  home.packages = with pkgs; [
    ripgrep
    fzf
    tmux
    fd
    trash-cli
    rnix-lsp
    neovim-remote
    gcc
    gnupg
    pura
  ];
  xdg.configFile = { nvim.source = ./nvim; };
  home.file = { ".tmux.conf".source = ./tmux/tmux.conf; };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./bash/bashrc;
    shellAliases = import ./bash/aliases.nix;
  };
  programs.git = {
    enable = true;
    iniContent = import ./git/gitconfig;
  };
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withRuby = false;
    withNodeJs = true;
    extraPython3Packages = (ps: with ps; [ pynvim ]);
  };
}
