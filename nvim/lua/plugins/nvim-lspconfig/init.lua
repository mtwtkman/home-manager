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

require("lspconfig.ui.windows").default_options = {
  border = "rounded",
}

local path = {
  source = utils.get_dir(debug.getinfo(1, "S").source) .. "/lang",
}
utils.iterate_child_modules(path, configure_lsp)
