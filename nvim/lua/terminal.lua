local utils = require("utils")
local tmap = utils.tmap
local nmap = utils.nmap

tmap("<ESC>", "<C-\\><C-n>", { silent = true })
tmap("<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })
tmap("<C-w>j", "<C-\\><C-n><C-w>j", { silent = true })
tmap("<C-w>k", "<C-\\><C-n><C-w>k", { silent = true })
tmap("<C-w>l", "<C-\\><C-n><C-w>l", { silent = true })
tmap("<C-w>gt", "<C-\\><C-n>gt", { silent = true })
tmap("<C-w>gT", "<C-\\><C-n>gT", { silent = true })
nmap("<leader>x", ":sp<CR><C-w>J20<C-w>_:FW 20<CR>:terminal<CR>", { silent = true })
nmap("<leader>st", ":sp<CR>:terminal<CR>", { silent = true })
nmap("<leader>vt", ":vsp<CR>:terminal<CR>", { silent = true })
nmap("<leader>tt", ":tabe<CR>:terminal<CR>", { silent = true })
local terminal_buffer_group = vim.api.nvim_create_augroup("TerminalBuffer", { clear = true })

vim.api.nvim_create_autocmd({ "TermEnter" }, {
  pattern = { "*" },
  command = "setlocal nonumber",
  group = terminal_buffer_group,
})
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  command = "startinsert",
  group = terminal_buffer_group,
})
