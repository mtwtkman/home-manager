local server_info = {
  servername = "hls",
  settings = {},
}
require("plugins.lsp").make_lspconfig(server_info)
