
local jdtls = require("jdtls")
local root_markers = { 'gradlew', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local cmd = { "jdt-language-server", "-data", workspace }
local config = require("lsp").make_default_config()

config.cmd = cmd
config.root_dir = root_dir
config.on_attach = function(client, bufnr)
  require("navigator.lspclient.mapping").setup({client=client, bufnr=bufnr})
  require("navigator.dochighlight").documentHighlight(bufnr)
  require("navigator.codeAction").code_action_prompt(bufnr)
end

jdtls.start_or_attach(config)
