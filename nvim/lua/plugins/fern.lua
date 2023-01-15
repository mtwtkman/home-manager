local set = vim.opt
local utils = require("utils")
local nmap = utils.nmap

nmap("<silent><leader>n", ":Fern . -drawer -toggle<CR>", { silent = true, buffer = true })
nmap("<silent><leader>m", ":Fern %:h -drawer -toggle<CR>", { silent = true, buffer = true })
vim.g["fern#default_hidden"] = 1
init_fern = function()
  nmap("v", "<Plug>(fern-action-open:side)", { buffer = true })
  nmap("x", "<Plug>(fern-action-lcd:cursor)", { buffer = true })
  nmap("r", "<Plug>(fern-action-reload)", { buffer = true })
end
local fern_group = vim.api.nvim_create_augroup("my-fern", { crear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "fern" },
  group = fern_group,
  callback = init_fern,
})

vim.g["Fern_mapping_fzf_customize_option"] = function(spec)
  spec.options ..= " --multi"
  if vim.fn.exists("*fzf#vim#with_preview") then
      return vim.fn["fzf#vim#with_preview"](spec)")
  else
      return spec
  end
end

vim.g["Fern_mapping_fzf_before_all"] = function(dict)
    if !vim.fn.len(dict.lines) then
        return
    end
    return dict.fern_helper.async.update_marks([])
end

local reveal = function(dict)
    vim.fn.execute("FernReveal -wait", dict.relative_path)
    vim.fn.execute("normal \<Plug>(fern-action-mark:set)")
end

vim.g["Fern_mapping_fzf_file_sink"] = reveal
vim.g["Fern_mapping_fzf_dir_sink"] = reveal
