local utils = require("utils")
local nmap = utils.nmap
local vmap = utils.vmap

nmap("<leader>g", ":GBrowse expand('<cWORD>')<CR>")
