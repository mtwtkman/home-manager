local utils = require("utils")

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "rebelot/kanagawa.nvim"
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "tpope/vim-fugitive"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  }
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-buffer"
  use "tpope/vim-rhubarb"
  use "lukas-reineke/indent-blankline.nvim"
  use {
    "ibhagwan/fzf-lua",
    requies = {
      "nvim-tree/nvim-web-devicons",
    }
  }
  use "mfussenegger/nvim-dap"
  use {
    "ldelossa/gh.nvim",
    requires = {
      "ldelossa/litee.nvim",
    }
  }
  use {
    "ggandor/leap.nvim",
    requires = {
      "tpope/vim-repeat",
    },
  }
  use "simrat39/symbols-outline.nvim"
  use "https://gitlab.com/yorickpeterse/nvim-window"
end)

local load_module = function(name)
  require("plugins." .. name)
end

utils.iterate_child_modules(debug.getinfo(1, "S"), load_module)
