local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace = vim.fn.expand("~/work") .. project
local cmd = { "jdt-language-server", "-data", workspace }
local root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])

local config = require("lsp").make_default_config()
config.cmd = cmd
config.root_dir = root_dir
require("jdtls").start_or_attach(config)
