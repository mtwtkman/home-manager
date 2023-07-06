local utils = require("utils")
local neogit = require("neogit")

utils.nmap("<leader>g", ":Neogit<CR>", { silent = true })
utils.nmap("<leader>G", function() neogit.open({ kind = "floating" }) end, { silent = true })

neogit.setup({
  integrations = {
    diffview = true,
  },
})
