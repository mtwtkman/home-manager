local server_info = {
  servername = "html",
  cmd = { "html-languageserver", "--stdio" },
  settings = {},
}
require("plugins.lsp").make_lspconfig(server_info)
