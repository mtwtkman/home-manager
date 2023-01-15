local set = vim.opt
local utils = require("utils")
local nmap = utils.nmap

nmap("<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true })
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

require("nvim-tree").setup({
  remove_keymaps = { "<C-v>", "<C-t>", "<2-RightMouse>", "<C-x>", "bmv", "d", "-", "<BS>", "o" },
  view = {
    mappings = {
      list = {
        { key = "v", action = "vsplit" },
        { key = "t", action = "tabnew" },
        { key = "s", action = "split" },
        { key = "M", action = "bulk_move" },
        { key = "u", action = "dir_up" },
        { key = "h", action = "close_node" },
        { key = "l", action = "edit" },
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
