local lsp_config = require("lsp").make_default_config()

vim.g.haskell_tools = {
  hls = {
    on_attach = function(client, bufnr, _)
      return lsp_config.on_attach(client, bufnr)
    end,
  },
  -- dap = {
  --   type = "haskell",
  --   request = "launch",
  --   name = "Debug",
  --   workspace = "${workspaceFolder}",
  --   startup = "${file}",
  --   stopOnEntry = true,
  --   logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
  --   logLevel = "DEBUG",
  --   ghciEnv = vim.empty_dict(),
  --   ghciPrompt = "λ: ",
  --   ghciInitialPrompt = "ghci> ",
  --   ghciCmd= "cabal exec -- ghci-dap --interactive -i ${workspaceFolder}",
  -- },
}
