local utils = require("utils")
local nmap = utils.nmap
local telescope = require("telescope")

local builtin = require('telescope.builtin')
nmap('<leader>o', builtin.find_files, {})
nmap('<leader>ff', builtin.live_grep, {})
nmap('<leader>b', builtin.buffers, {})

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

telescope("telescope").load_extension("fzf")


