local lazy = require("lazy")

local plugins = {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("plugins.catppuccin")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "arkav/lualine-lsp-progress",
    },
    config = function()
      require("plugins.lualine")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.nvim-treesitter")
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.nvim-tree")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.nvim-lspconfig")
    end,
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
  },
  "saadparwaiz1/cmp_luasnip",
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.LuaSnip")
    end,
  },
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  {
    "rcarriga/cmp-dap",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline")
    end,
  },
  {
    "ibhagwan/fzf-lua",
    requies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.fzf-lua")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.nvim-dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("plugins.nvim-dap-ui")
    end,
  },
  {
    "folke/flash.nvim",
    config = function()
      require("plugins.flash")
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("plugins.symbols-outline")
    end,
  },
  {
    "https://gitlab.com/yorickpeterse/nvim-window",
    config = function()
      require("plugins.nvim-window")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.Comment")
    end
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.diffview")
    end
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("plugins.marks")
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.neogit")
    end
  },
  "mfussenegger/nvim-jdtls",
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.barbecue")
    end,
  },
}

local opts = {
  defaults = {
    lazy = true,
  },
}

if vim.fn.has_key(vim.fn.environ(), "LAZY_NVIM_CONFIG_DIR") == 1 then
  local config_dir = vim.env["LAZY_NVIM_CONFIG_DIR"]
  vim.opt.runtimepath:append(config_dir)
  opts = {
    lockfile = config_dir .. "/plugin/lazy-lock.json",
  }
end

lazy.setup(plugins, opts)

vim.api.nvim_create_user_command("LazySync", lazy.sync, {})
