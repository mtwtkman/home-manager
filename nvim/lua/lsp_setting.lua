local utils = require "utils"

local start_lsp_server = function(cmd, root_path_detectors)
  vim.lsp.start({
    name = cmd,
    cmd = {cmd},
    root_dir = vim.fs.dirname(vim.fs.find(root_path_detectors, {upward = true})[1]),
  })
end

local make_setting = function(exts, command, root_path_detectors)
  return {
    exts = utils.map_array(exts, function(v) return "*." .. v end),
    command = command,
    lsp = function()
      start_lsp_server(command, root_path_detectors)
    end,
  }
end

local haskell = make_setting({"hs", "lhs"}, "haskell-language-server", {"*.cabal"})

local setup = function(setting)
  if (vim.fn["executable"](setting.command) == 0) then
    return
  end
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = setting.exts,
    callback = setting.lsp,
  })
end

local settings = {
  haskell
}

for i=1,#settings,1 do
  setup(settings[i])
end
