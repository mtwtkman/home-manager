local set = vim.opt
local utils = require("utils")
local nmap = utils.nmap

set.hidden = true
set.undofile = true
set.encoding = "UTF-8"
set.shiftwidth = 2
set.smartindent = true
set.smarttab = true
set.showmatch = true
set.whichwrap = {
  b = true,
  s = true,
  h = true,
  l = true,
  ["<"] = true,
  [">"] = true,
  ["["] = true,
  ["]"] = true,
}
set.backup = false
set.writebackup = false
set.swapfile = false
set.history = 1000
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.foldmethod = "marker"
set.mouse = ""
set.clipboard = "unnamed"
if vim.fn.has("wsl") then
  vim.cmd([[
    augroup Yank
      autocmd!
      autocmd TextYankPost * :call system(system("which clip.exe"), @")
    augroup END
  ]])
end
set.splitbelow = true
set.splitright = true
set.updatetime = 300
set.shortmess:append("c")
set.backspace = { "indent", "eol", "start" }
vim.g.mapleader = ","
nmap("<ESC><ESC>", ":<C-u>nohlsearch<CR>")
if vim.fn.executable('nvr') then
  vim.env.GIT_EDITOR = "nvr -cc split --remote-wait"
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "gitrebase", "gitconfig" },
    callback = function() set.bufhidden = "delete" end
  })
end
