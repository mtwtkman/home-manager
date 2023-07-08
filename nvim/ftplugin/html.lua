local server_info = {
  servername = "html",
  cmd = { "html-languageserver", "--stdio" },
  settings = {},
}
require("lsp").make_lspconfig(server_info)
