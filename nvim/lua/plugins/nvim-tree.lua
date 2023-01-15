local set = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

require("nvim-tree").setup({
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    }
  },
})
