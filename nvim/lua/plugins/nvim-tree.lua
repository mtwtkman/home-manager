local set = vim.opt
local utils = require("utils")
local nmap = utils.nmap
local nvim_tree_api = require("nvim-tree.api")

nmap("<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true })
nmap("<C-w>n", ":NvimTreeFindFile<CR>", { silent = true })
nmap("<leader>mn", nvim_tree_api.marks.navigate.next, { silent = true })
nmap("<leader>mp", nvim_tree_api.marks.navigate.prev, { silent = true })
nmap("<leader>ms", nvim_tree_api.marks.navigate.select, { silent = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.termguicolors = true

local open_nvim_tree = function(data)
  local is_directory = vim.fn.isdirectory(data.file) == 1
  if not is_directory then
    return
  end
  vim.cmd.cd(data.file)
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require("nvim-tree").setup({
    remove_keymaps = {
        "<C-v>",
        "<C-t>",
        "<2-RightMouse>",
        "<C-x>",
        "bmv",
        "d",
        "-",
        "<BS>",
        "o"
    },
    view = {
        mappings = {
            list = {
                { key = "v", action = "vsplit" },
                { key = "t", action = "tabnew" },
                { key = "s", action = "split" },
                { key = "M", action = "bulk_move" },
                { key = "u", action = "dir_up" },
                { key = "h", action = "close_node" },
                { key = "l", action = "edit" },
            },
        },
    },
    trash = {
        cmd = "trash-put",
    },
    diagnostics = {
        enable = true,
    },
})

