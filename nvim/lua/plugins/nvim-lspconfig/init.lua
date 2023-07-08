local utils = require("utils")
local lsp = require("lsp")

local configure_lsp = function(langtype)
  local server_info = require("plugins.nvim-lspconfig.lang." .. langtype)
  local config = lsp.make_default_config()
  if server_info.settings ~= nil then
    config.settings = server_info.settings
  end
  if server_info.cmd ~= nil then
    config.cmd = server_info.cmd
  end
  require("lspconfig")[server_info.servername].setup(config)
end
utils.iterate_child_modules(debug.getinfo(1, "S"), configure_lsp)
