local catppuccin = require("catppuccin")
catppuccin.setup({
  transparent_background = true,
  term_colors = true,
  integrations = {
    symbols_outline = true,
    neogit = true,
  },
})
vim.cmd.colorscheme("catppuccin")
