{ config, pkgs, ... }:
let
  meta = import ./meta.nix;
  pura = import ./packages/pura.nix { nixpkgs = pkgs; };
  inherit (config.lib.file) mkOutOfStoreSymlink;
in
{
  home.username = meta.username;
  home.homeDirectory = meta.home;
  home.stateVersion = meta.homeManagerStateVersion;
  home.sessionVariables = {
    NIX_CONF_DIR = meta.nixConfigDirectory;
    EDITOR = "nvim";
    PS1 = "\\u@\\w\$ ";
  };
  home.packages = with pkgs; [
    ripgrep
    tmux
    fd
    trash-cli
    rnix-lsp
    neovim-remote
    gcc
    gnupg
    pura
    _1password
    bat
    fzf
    git
    bash
    direnv
  ];
  xdg.configFile = {
    nvim.source = ./nvim;
    "nvim/lua".source = ./nvim/lua;
  };
  home.file = { ".tmux.conf".source = ./tmux/tmux.conf; };

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
      ];
      fileWidgetCommand = defaultCommand;
    };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./bash/bashrc;
    shellAliases = import ./bash/aliases.nix;
    sessionVariables = {
      VSNIP_PATH = meta.nixConfigDirectory + "/nvim/snippets";
    };
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
