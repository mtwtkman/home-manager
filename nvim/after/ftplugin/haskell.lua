local server_info = {
  servername = "hls",
  settings = {},
}
require("lsp").make_lspconfig(server_info)
