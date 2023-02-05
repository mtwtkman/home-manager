local fzf = require("fzf-lua")
local utils = require("utils")
local nmap = utils.nmap

fzf.setup({
  winopts = {
    height = 0.6,
    width = 0.9,
  },
})

nmap("<leader>o", ":FzfLua files<CR>", { silent = true })
nmap("<leader>b", ":FzfLua buffers<CR>", { silent = true })
nmap("<leader>ff", ":FzfLua grep<CR>", { silent = true })
nmap("<leader>fl", ":FzfLua grep_last<CR>", { silent = true })
nmap("<leader>fp", ":FzfLua grep_project<CR>", { silent = true })
nmap("<leader>fW", ":FzfLua grep_cWORD<CR>", { silent = true })
nmap("<leader>fw", ":FzfLua grep_cword<CR>", { silent = true })
nmap("<leader>/", ":FzfLua blines<CR>", { silent = true })
nmap("<C-p>", ":FzfLua commands<CR>", { silent = true })
nmap("<leader>hh", ":FzfLua oldfiles<CR>", { silent = true })
nmap("<leader>h:", ":FzfLua command_history<CR>", { silent = true })
nmap("<leader>h/", ":FzfLua search_history<CR>", { silent = true })
nmap("<space>q", ":FzfLua lsp_document_diagnostics<CR>", { silent = true })
nmap("<space>Q", ":FzfLua lsp_workspace_diagnostics<CR>", { silent = true })
nmap("gr", ":FzfLua lsp_references<CR>", { silent = true })

vim.api.nvim_create_user_command("Commands", fzf.commands, {})
vim.api.nvim_create_user_command("HelpTags", fzf.help_tags, {})
vim.api.nvim_create_user_command("Marks", fzf.marks, {})
vim.api.nvim_create_user_command("Jumps", fzf.jumps, {})
vim.api.nvim_create_user_command("Maps", fzf.keymaps, {})
vim.api.nvim_create_user_command("Branches", fzf.git_branches, {})
vim.api.nvim_create_user_command("Commits", fzf.git_commits, {})
vim.api.nvim_create_user_command("LspWorkspaceDiagnostics", fzf.lsp_workspace_diagnostics, {})
vim.api.nvim_create_user_command("LspDoumentDiagnostics", fzf.lsp_document_diagnostics, {})
vim.api.nvim_create_user_command("LspReferences", fzf.lsp_references, {})
vim.cmd("FzfLua register_ui_select")
