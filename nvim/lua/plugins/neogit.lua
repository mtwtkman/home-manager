local utils = require("utils")
utils.nmap("<leader>g", ":Neogit<CR>", { silent = true })

require("neogit").setup({
  integrations = {
    diffview = true,
  },
})
