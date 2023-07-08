local server_info = {
  servername = "rnix",
  settings = {},
}

require("lsp").make_lspconfig(server_info)
