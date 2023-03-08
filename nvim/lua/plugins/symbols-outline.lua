local utils = require("utils")
require("symbols-outline").setup()

utils.nmap("<leader>l", ":SymbolsOutline<CR>", { silent = true })
