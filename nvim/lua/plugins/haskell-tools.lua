local nmap = require("utils").nmap

local lsp_config = require("lsp").make_default_config()

vim.g.haskell_tools = {
  hls = {
    on_attach = function(client, bufnr, ht)
      print("haskell tools on_attach!")
      nmap("<space>hs", ht.hoogle.hoogle_signature, { silent = true })
      nmap("<space>ea", ht.lsp.buf_eval_all, { silent = true })
      return lsp_config.on_attach(client, bufnr)
    end,
  },
}
