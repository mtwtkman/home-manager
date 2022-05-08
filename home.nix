{ config, pkgs, ... }:
{
  home.username = "mtwtkman";
  home.homeDirectory = "/home/mtwtkman";
  home.stateVersion = "22.05";
  home.sessionVariables = {
    NIX_CONF_DIR = "$HOME/.config/nixpkgs";
  };
  home.packages = with pkgs; [
    ripgrep
    fzf
    tmux
    fd
    trash-cli
    rnix-lsp
    neovim-remote
  ];
  xdg.configFile = {
    nvim.source = ./nvim;
  };
  home.file = {
    ".tmux.conf".source = ./tmux/tmux.conf;
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
    extraPython3Packages = (ps: with ps; [
      pynvim
    ]);
  };
}
