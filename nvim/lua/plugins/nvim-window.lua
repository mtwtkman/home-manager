local utils = require("utils")
local nvim_window = require("nvim-window")

nvim_window.setup({
  normal_hl = "Cursor",
})
utils.nmap("<leader>p", nvim_window.pick, { silent = true })
