local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace = vim.fn.expand("~/work") .. project
local config = {
  cmd = {
    "jdt-language-server",
    "-data",
    workspace,
  },
}
require("jdtls").start_or_attach(config)
print("hi")
