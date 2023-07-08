local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace = vim.fn.expand("~/work") .. project

return {
  servername = "jdtls",
  cmd = {
    "jdt-language-server",
    "-data",
    workspace,
  },
  disable = true,
}
