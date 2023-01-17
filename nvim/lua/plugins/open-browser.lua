local utils = require("utils")
local nmap = utils.nmap
local tmap = utils.tmap

vim.g.netrw_nogx = 1
nmap("<leader>g", "<Plug>(openbrowser-smart-search)")
