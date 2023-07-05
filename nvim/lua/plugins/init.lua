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
      requires = {
        "L3MON4D3/LuaSnip",
      },
      config = function()
        require("plugins.nvim-cmp")
      end,
    }
    use { 'saadparwaiz1/cmp_luasnip' }
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("plugins.LuaSnip")
      end,
    }
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-buffer"
    use {
      "rcarriga/cmp-dap",
      requires = {
        "mfussenegger/nvim-dap",
      },
    }
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
      "rcarriga/nvim-dap-ui",
      requires = {
        "mfussenegger/nvim-dap",
      },
      config = function()
        require("plugins.nvim-dap-ui")
      end,
    }
    use {
      "ldelossa/gh.nvim",
      requires = {
        "ldelossa/litee.nvim",
      },
    }
    use {
      "folke/flash.nvim",
      config = function()
        require("plugins.flash")
      end
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
      "SmiteshP/nvim-navbuddy",
      requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
      },
    }
    use {
      "SmiteshP/nvim-navic",
      requires = {
        "neovim/nvim-lspconfig",
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
    use {
      "chentoast/marks.nvim",
      config = function()
        require("plugins.marks")
      end,
    }
    use {
      "NeogitOrg/neogit",
      requires = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("plugins.neogit")
      end
    }
    use {
      "folke/tokyonight.nvim",
      config = function()
        require("plugins.tokyonight")
      end
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
require("plugins.indent-blankline")
