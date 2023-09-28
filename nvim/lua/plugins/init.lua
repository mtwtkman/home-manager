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
    build = ":TSUpdate",
    config = function()
      require("plugins.nvim-treesitter")
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
  },
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
    event = "VeryLazy",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = "VeryLazy",
  },
  {
    "hrsh7th/cmp-path",
    event = "VeryLazy",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
    event = "VeryLazy",
  },
  {
    "saadparwaiz1/cmp_luasnip",
    event = "VeryLazy",
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.LuaSnip")
    end,
    event = "VeryLazy",
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
  },
  {
    "hrsh7th/cmp-buffer",
    event = "VeryLazy",
  },
  {
    "rcarriga/cmp-dap",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent-blankline")
    end,
    main = "ibl",
    event = "VeryLazy",
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.fzf-lua")
    end,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("plugins.nvim-dap")
    end,
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("plugins.nvim-dap-ui")
    end,
    event = "VeryLazy",
  },
  {
    "folke/flash.nvim",
    config = function()
      require("plugins.flash")
    end,
    event = "VeryLazy",
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("plugins.aerial")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },
  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("plugins.nvim-window-picker")
    end,
    version = "2.*",
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
    event = "VeryLazy",
  },
  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.Comment")
    end,
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.diffview")
    end,
    event = "VeryLazy",
  },
  {
    "chentoast/marks.nvim",
    config = function()
      require("plugins.marks")
    end,
    event = "VeryLazy",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.neogit")
    end,
    event = "VeryLazy",
  },
  {
    "mfussenegger/nvim-jdtls",
    event = "VeryLazy",
  },
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.barbecue")
    end,
    event = "VeryLazy",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.toggleterm")
    end,
    event = "VeryLazy",
  },
}

local opts = {
  ui = {
    border = "rounded",
  },
}

if vim.fn.has_key(vim.fn.environ(), "LAZY_NVIM_CONFIG_DIR") == 1 then
  local config_dir = vim.env["LAZY_NVIM_CONFIG_DIR"]
  vim.opt.runtimepath:append(config_dir)
  opts.lockfile = config_dir .. "/plugin/lazy-lock.json"
end

lazy.setup(plugins, opts)

vim.api.nvim_create_user_command("LazySync", lazy.sync, {})
