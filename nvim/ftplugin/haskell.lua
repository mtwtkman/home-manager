local lsp_config = require("lsp").make_default_config()

vim.g.haskell_tools = {
  hls = {
    on_attach = function(client, bufnr, _)
      return lsp_config.on_attach(client, bufnr)
    end,
  },
}
