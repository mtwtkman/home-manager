local utils = require("utils")
local nmap = utils.nmap
local telescope = require("telescope")

telescope.setup({
  defaults = {
    sorting_strategy = "ascending",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

local builtin = require('telescope.builtin')
nmap('<leader>o', builtin.find_files, { silent = true })
nmap('<leader>ff', builtin.live_grep, { silent = true })
nmap('<leader>fw', builtin.grep_string, { silent = true })
nmap('<leader>b', builtin.buffers, { silent = true })
nmap('<leader>hh', builtin.oldfiles, { silent = true })
nmap('<leader>h:', builtin.command_history, { silent = true })
nmap('<leader>h/', builtin.search_history, { silent = true })
nmap('<C-p>', builtin.commands, { silent = true })
nmap('<leader>/', builtin.current_buffer_fuzzy_find, { silent = true })
nmap('<space>q', builtin.diagnostics, { silent = true })
nmap('gr', builtin.lsp_references, { silent = true })
nmap('<leader>M', telescope.extensions.grapple.tags, { silent = true })

vim.api.nvim_create_user_command("Maps", builtin.keymaps, {})
vim.api.nvim_create_user_command("GitCommits", builtin.git_commits, {})
vim.api.nvim_create_user_command("GitBranches", builtin.git_branches, {})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("grapple")
