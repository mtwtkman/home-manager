local cmd = vim.cmd
local set = vim.opt
local nmap = require("utils").nmap

cmd.syntax("enable")
cmd.colorscheme("jellybeans")
cmd.filetype({ "plugin", "indent", "on" })

set.termguicolors = true
set.number = true
set.ruler = true
set.title = true
set.showtabline = 2
set.tabstop = 2
set.expandtab = true
set.cmdheight = 2
set.wrap = false
set.scrolloff = 5
set.signcolumn = "yes"
local fixsize = function(params)
  vim.fn.execute("resize " .. params.args)
  set.wfh = true
  set.wfw = true
end
vim.api.nvim_create_user_command("FW", fixsize, { nargs = 1 })
nmap("fw", ":FW<space>", { silent = true })
