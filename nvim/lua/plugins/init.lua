local utils = require("utils")

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nanotech/jellybeans.vim"
  use "vim-airline/vim-airline"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-context"
  use "tyru/open-browser.vim"
  use "tpope/vim-fugitive"
  use "junegunn/fzf.vim"
  use "junegunn/fzf"
  use "nvim-tree/nvim-tree.lua"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/cmp-vsnip"
end)

local load_plugin = function(name)
  require("plugins." .. name)
end

utils.each(load_plugin, {
  "open-browser",
  "fzf",
  "nvim-tree",
  "nvim-cmp",
  "nvim-treesitter",
  "nvim-lspconfig",
})
