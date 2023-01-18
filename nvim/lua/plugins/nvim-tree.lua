local set = vim.opt
local utils = require("utils")
local nmap = utils.nmap

nmap("<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true })
nmap("<C-w>n", ":NvimTreeFindFile<CR>", { silent = true })

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
        default = "",
        symlink = "",
        bookmark = "b",
        modified = "m",
        folder = {
          arrow_closed = "+",
          arrow_open = "-",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
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
