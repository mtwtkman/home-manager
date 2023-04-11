return {
  adapter = {
    type = "executable",
    command = "haskell-debug-adapter",
    args = {"--hackage-version=0.0.38.0"},
  },
  client = {
    {
      type = "haskell",
      request = "launch",
      name = "Debug",
      workspace = "${workspaceFolder}",
      startup = "${file}",
      stopOnEntry = true,
      logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
      logLevel = "WARNING",
      ghciEnv = vim.empty_dict(),
      ghciPrompt = "λ: ",
      ghciInitialPrompt = "λ: ",
      ghciCmd= "cabal repl -w ghci-dap --repl-no-load --builddir=${workspaceFolder}/.debug/dist-cabal-repl",
    },
  },
}
