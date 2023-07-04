local utils = require("utils")
local neogit = require("neogit")
neogit.setup({})
utils.nmap("<leader>g", ":Neogit<CR>", { silent = true })
