local utils = require("utils")
local nmap = utils.nmap

vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
nmap("<leader>o", ":Files<CR>", { silent = true })
nmap("<leader>b", ":Buffers<CR>", { silent = true })
nmap("<leader>f", ":Rg<CR>", { silent = true })
nmap("<leader>F", ":RgFzf<CR>", { silent = true })
nmap("<leader>/", ":BLines<CR>", { silent = true })
nmap("<leader>'", ":Marks<CR>", { silent = true })
nmap("<leader>c", ":Commits<CR>", { silent = true })
nmap("<C-p>", ":Commands<CR>", { silent = true })
nmap("<leader>hh", ":History<CR>", { silent = true })
nmap("<leader>h:", ":History:<CR>", { silent = true })
nmap("<leader>h/", ":History/<CR>", { silent = true })
local ripgrep = function(params)
  local query = params.args
  local command_fmt = "rg --column --line-number --no-heading --color=always --smart-case -- %s || true"
  local initial_command = vim.fn.printf(command_fmt, vim.fn.shellescape(query))
  local reload_command = vim.fn.printf(command_fmt, "{q}")
  local spec = { options = {"--disabled", "--query", query, "--bind", "change:reload:" .. reload_command } }
  local spec = vim.fn["fzf#vim#with_preview"](spec, "right", "ctrl-/")
  vim.fn["fzf#vim#grep"](initial_command, true, spec, params.bang)
end
vim.api.nvim_create_user_command("Rg", ripgrep, {
  bang = true,
  nargs = "*",
})

local ripgrep_fzf = function(params)
  local command = "rg --column --line-number --no-heading --color=always --smart-case -- " .. vim.fn.shellescape(params.args)
  vim.fn["fzf#vim#grep"](command, true, vim.fn["fzf#vim#with_preview"](), params.bang)
end
vim.api.nvim_create_user_command("RgFzf", ripgrep_fzf, {
  bang = true,
  nargs = "*",
})
