local utils = require("utils")
local nmap = utils.nmap
local telescope = require("telescope")

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
})

telescope.load_extension("fzf")
telescope.load_extension("lsp_handlers")

local builtin = require('telescope.builtin')
nmap('<leader>o', builtin.find_files, { silent = true })
nmap('<leader>ff', builtin.live_grep, { silent = true })
nmap('<leader>b', builtin.buffers, { silent = true })
nmap('<leader>hh', builtin.oldfiles, { silent = true })
nmap('<leader>h:', builtin.command_history, { silent = true })
nmap('<leader>h/', builtin.search_history, { silent = true })
nmap('<C-p>', builtin.commands, { silent = true })
nmap('<leader>/', builtin.current_buffer_fuzzy_find, { silent = true })
nmap('<space>q', builtin.diagnostics, { silent = true })
nmap('gr', builtin.lsp_references, { silent = true })

vim.api.nvim_create_user_command("Maps", builtin.keymaps, {})
vim.api.nvim_create_user_command("GitCommits", builtin.git_commits, {})
vim.api.nvim_create_user_command("GitBranches", builtin.git_branches, {})

