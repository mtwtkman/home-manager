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
nmap("<leader>f", ":FzfLua grep_project<CR>", { silent = true })
nmap("<leader>/", ":FzfLua lines<CR>", { silent = true })
nmap("<leader>c", ":FzfLua git_commits<CR>", { silent = true })
nmap("<C-p>", ":FzfLua commands<CR>", { silent = true })
nmap("<leader>hh", ":FzfLua oldfiles<CR>", { silent = true })
nmap("<leader>h:", ":FzfLua command_history<CR>", { silent = true })
nmap("<leader>h/", ":FzfLua search_history<CR>", { silent = true })

vim.api.nvim_create_user_command("Commands", fzf.commands, {})
vim.api.nvim_create_user_command("HelpTags", fzf.help_tags, {})
vim.api.nvim_create_user_command("Maps", fzf.keymaps, {})
vim.cmd("FzfLua register_ui_select")
