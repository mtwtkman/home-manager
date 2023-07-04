{ config, pkgs, ... }:
let
  meta = import ./meta.nix;
  pura = import ./packages/pura.nix { nixpkgs = pkgs; };
  inherit (config.lib.file) mkOutOfStoreSymlink;
  platformSetiting = if meta.isWsl2 then (import ./kernel/wsl2.nix { pkgs = pkgs; binPath = meta.localBinPath; }) else {
    symlinks = { };
    packages = [ ];
  };
in
{
  home.username = meta.username;
  home.homeDirectory = meta.home;
  home.stateVersion = meta.homeManagerStateVersion;
  home.sessionPath = [
    meta.localBinPath
  ];
  home.sessionVariables = {
    NIX_HOME_MANAGER_ROOT = meta.homeManagerDirectory;
    EDITOR = "nvim";
    SNIPPET_PATH = meta.homeManagerDirectory + "/nvim/snippets";
    PACKER_NVIM_CONFIG_DIR = meta.homeManagerDirectory + "/nvim/.config";
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";
  };
  home.packages = with pkgs; [
    xdg-utils
    nix-prefetch-git
    cachix
    ripgrep
    tmux
    fd
    trash-cli
    rnix-lsp
    neovim-remote
    gcc
    gnupg
    pura
    bat
    fzf
    git
    bash
    direnv
    gh
    lua-language-server
    nurl
    jq
    bottom
  ] ++ platformSetiting.packages;
  xdg.configFile = {
    nvim.source = ./nvim;
    "nvim/lua".source = ./nvim/lua;
  };
  home.file = {
    ".tmux.conf" = {
      source = ./tmux/tmux.conf;
    };
  } // platformSetiting.symlinks;

  programs.fzf =
    let
      defaultCommand = "rg --files --no-ignore --hidden --follow -g \"!{.git,node_modules}/*\" 2> /dev/null";
    in
    {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = false;
      enableFishIntegration = false;
      defaultCommand = defaultCommand;
      defaultOptions = [
        "--reverse"
        "--extended"
        "--multi"
        "--inline-info"
        "--prompt='fzf>'"
        "--ansi"
        "--preview='bat --style=full --color=always {}'"
        "--bind=ctrl-f:page-down,ctrl-b:page-up,'ctrl-v:become(vim {})',ctrl-^:first,ctrl-/:last"
      ];
      fileWidgetCommand = defaultCommand;
      tmux = {
        enableShellIntegration = true;
      };
    };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.home-manager = {
    enable = true;
    path = pkgs.lib.mkForce meta.homeManagerDirectory;
  };
  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./bash/bashrc;
    initExtra = platformSetiting.bashConfig;
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
    plugins = [
      pkgs.vimPlugins.packer-nvim
    ];
  };
}
