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
end)

local load_plugin = function(name)
  require("plugins." .. name)
end

utils.each(load_plugin, {
  "nvim-treesitter",
  "open-browser",
  "fzf",
  "nvim-lspconfig",
  "nvim-tree",
})
