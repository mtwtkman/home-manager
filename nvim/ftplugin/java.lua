local root_markers = {'gradlew', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local cmd = { "jdt-language-server", "-data", workspace }
local config = require("lsp").make_default_config()

config.cmd = cmd
config.root_dir = root_dir
require("jdtls").start_or_attach(config)
