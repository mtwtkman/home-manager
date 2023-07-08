local server_info = {
  servername = "lua_ls",
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
require("plugins.lsp").make_lspconfig(server_info)