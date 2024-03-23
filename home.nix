{ pkgs, ... }:
let
  meta = import ./meta.nix;

  platformSetting = if meta.isWsl2 then (import ./kernel/wsl2.nix { pkgs = pkgs; binPath = meta.localBinPath; }) else {
    symlinks = { };
    packages = [ ];
    sessionVariables = { };
    bashConfig = "";
  };

  manualInstalledPackages = import ./packages { nixpkgs = pkgs; };
  catppuccinBatThemes = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "bat";
    rev = "main";
    hash = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
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
    LAZY_NVIM_CONFIG_DIR = meta.homeManagerDirectory + "/nvim/.config";
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";
  } // platformSetting.sessionVariables;
  home.packages = with pkgs; [
    tree-sitter
    niv
    xdg-utils
    nix-prefetch-git
    ripgrep
    fd
    trash-cli
    nil
    neovim-remote
    gcc
    gnupg
    bat
    fzf
    git
    bash
    direnv
    lua-language-server
    nurl
    jq
    bottom
    nixpkgs-fmt
    gnumake
  ] ++ platformSetting.packages ++ manualInstalledPackages;
  xdg.configFile = {
    nvim.source = ./nvim;
    "nvim/lua".source = ./nvim/lua;
    "bottom/bottom.toml".source = ./bottom/bottom.toml;
  };
  home.file = platformSetting.symlinks;

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ./tmux/tmux.conf;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_status_modules "directory session"
          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
    ];
  };

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
        "--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8"
        "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
        "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
      ];
      fileWidgetCommand = defaultCommand;
      tmux = {
        enableShellIntegration = true;
      };
    };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
  programs.home-manager = {
    enable = true;
    path = pkgs.lib.mkForce meta.homeManagerDirectory;
  };
  programs.bash = {
    enable = true;
    bashrcExtra = builtins.readFile ./bash/bashrc;
    initExtra = platformSetting.bashConfig;
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
      pkgs.vimPlugins.lazy-nvim
    ];
  };
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
    };
    themes = {
      Catppuccin-mocha = {
        src = catppuccinBatThemes;
        file = "/Catppuccin-mocha.tmTheme";
      };
      Catppuccin-frappe = {
        src = catppuccinBatThemes;
        file = "/Catppuccin-frappe.tmTheme";
      };
      Catppuccin-latte = {
        src = catppuccinBatThemes;
        file = "/Catppuccin-latte.tmTheme";
      };
      Catppuccin-macchiato = {
        src = catppuccinBatThemes;
        file = "/Catppuccin-macchiato.tmTheme";
      };
    };
  };
}
