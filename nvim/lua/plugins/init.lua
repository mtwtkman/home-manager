require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "prabirshrestha/async.vim"
  use "prabirshrestha/asyncomplete.vim"
  use "prabirshrestha/vim-lsp"
  use "prabirshrestha/asyncomplete-lsp.vim"
  use "nanotech/jellybeans.vim"
  use "vim-airline/vim-airline"
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-context"
  use "tyru/open-browser.vim"
  use "tpope/vim-fugitive"
  use "junegunn/fzf.vim"
  use "junegunn/fzf"
  use "nvim-tree/nvim-tree.lua"
end)

require("plugins.nvim-treesitter")
require("plugins.open-browser")
require("plugins.fzf")
