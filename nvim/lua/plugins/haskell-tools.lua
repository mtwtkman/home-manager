local nmap = require("utils").nmap

vim.g.haskell_tools = {
  hls = {
    on_attach = function(client, bufnr, ht)
      require("navigator.lspclient.mapping").setup({client=client, bufnr=bufnr})
      require("navigator.dochighlight").documentHighlight(bufnr)
      require("navigator.codeAction").code_action_prompt(bufnr)
      nmap("<space>hs", ht.hoogle.hoogle_signature, { silent = true })
      nmap("<space>ea", ht.lsp.buf_eval_all, { silent = true })
    end,
  },
}
