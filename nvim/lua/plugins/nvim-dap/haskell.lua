local M = {}

M.setup = function(dap)
  dap.adapters.haskell = {
    type = "executable",
    command = "haskell-debug-adapter",
    args = {"--hackage-version=0.0.33.0"},
  }

  dap.configurations.haskell = {
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
  }
end

return M
