local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace = vim.fn.expand("~/work") .. project

local server_info = {
  cmd = { "jdt-language-server", "-data", workspace },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {},
}

local config = require("plugins.lsp").make_config(server_info)
require("jdtls").start_or_attach(config)
