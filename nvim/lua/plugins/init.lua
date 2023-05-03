local packer_util = require("packer.util")

local spec = {
  function(use)
    use "wbthomason/packer.nvim"
    use "rebelot/kanagawa.nvim"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
        "arkav/lualine-lsp-progress",
      },
      config = function()
        require("plugins.lualine")
      end,
    }
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("plugins.nvim-treesitter")
      end,
    }
    use "nvim-treesitter/nvim-treesitter-context"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use {
      "nvim-tree/nvim-tree.lua",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("plugins.nvim-tree")
      end,
    }
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("plugins.nvim-lspconfig")
      end,
    }
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use {
      "hrsh7th/nvim-cmp",
      config = function()
        require("plugins.nvim-cmp")
      end,
    }
    use {
      "hrsh7th/vim-vsnip",
      config = function()
        require("plugins.vim-vsnip")
      end,
    }
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-buffer"
    use {
      "rcarriga/cmp-dap",
      requires = {
        "mfussenegger/nvim-dap",
      },
    }
    use {
      "tpope/vim-fugitive",
      config = function()
        require("plugins.vim-fugitive")
      end,
    }
    use "tpope/vim-rhubarb"
    use "lukas-reineke/indent-blankline.nvim"
    use {
      "ibhagwan/fzf-lua",
      requies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("plugins.fzf-lua")
      end,
    }
    use {
      "mfussenegger/nvim-dap",
      config = function()
        require("plugins.nvim-dap")
      end,
    }
    use {
      "ldelossa/gh.nvim",
      requires = {
        "ldelossa/litee.nvim",
      },
    }
    use {
      "ggandor/leap.nvim",
      requires = {
        "tpope/vim-repeat",
      },
      config = function()
        require("plugins.leap")
      end,
    }
    use {
      "simrat39/symbols-outline.nvim",
      config = function()
        require("plugins.symbols-outline")
      end,
    }
    use {
      "https://gitlab.com/yorickpeterse/nvim-window",
      config = function()
        require("plugins.nvim-window")
      end,
    }
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("plugins.gitsigns")
      end,
    }
    use {
      "chrishrb/gx.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("plugins.gx")
      end,
    }
    use {
      "SmiteshP/nvim-navbuddy",
      requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
    }
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("plugins.Comment")
      end
    }
    use {
      "sindrets/diffview.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
      },
    }
  end,
}

if vim.fn.has_key(vim.fn.environ(), "PACKER_NVIM_CONFIG_DIR") == 1 then
  local config_dir = vim.env["PACKER_NVIM_CONFIG_DIR"]
  vim.opt.runtimepath:append(config_dir)
  spec.config = {
    compile_path = packer_util.join_paths(config_dir, "plugin", "packer_compiled.lua"),
  }
end

require("packer").startup(spec)

require("plugins.kanagawa") -- NOTE: packer setup does not work.
