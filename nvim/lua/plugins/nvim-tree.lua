local set = vim.opt
local utils = require("utils")
local nmap = utils.nmap

nmap("<leader>n", ":NvimTreeToggle<CR>", { silent = true })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "r", action= "trash" }
      },
    },
  },
  trash = {
    cmd = "trash-put",
  },
  renderer = {
    icons = {
      glyphs = {
        default = " ",
        symlink = "l",
        folder = {
          arrow_closed = "+",
          arrow_open = "-",
          default = "d",
          open = "+",
          empty = "x",
          empty_open = "x",
          symlink = "l",
          symlink_open = "l",
        },
        git = {
          unstaged = "s",
          staged = "S",
          unmerged = "m",
          renamed = "r",
          untracked = "t",
          deleted = "d",
          ignored = "x",
        },
      },
    },
  },
})
