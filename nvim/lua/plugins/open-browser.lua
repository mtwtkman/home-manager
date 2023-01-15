local utils = require("utils")
local nmap = utils.nmap
local tmap = utils.tmap

vim.g.netrw_nogx = 1
nmap("gx", "<Plug>(openbrowser-smart-search)")
tmap("gx", "<Plug>(openbrowser-smart-search)")
