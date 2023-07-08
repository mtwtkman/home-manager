local server_info = {
  servername = "rnix",
  settings = {},
}

require("plugins.lsp").make_lspconfig(server_info)
