local server_info = {
  servername = "elmls",
  settings = {},
}
require("plugins.lsp").make_lspconfig(server_info)
