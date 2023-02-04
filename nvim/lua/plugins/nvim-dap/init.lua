local utils = require("utils")
local dap = require("dap")
local ui = require("dap.ui.widgets")
local nmap = utils.nmap

nmap("<leader>dc", dap.continue, { silent = true })
nmap("<leader>do", dap.step_over, { silent = true })
nmap("<leader>di", dap.step_into, { silent = true })
nmap("<leader>", dap.step_out, { silent = true })
nmap("<leader>db", dap.toggle_breakpoint, { silent = true })
nmap("<leader>dr", dap.repl.open, { silent = true })
nmap("<leader>dl", dap.run_last, { silent = true })
nmap("<leader>dh", ui.hover, { silent = true })
nmap("<leader>dp", ui.preview, { silent = true })
nmap("<leader>df", function() ui.centered_float(ui.frames) end, { silent = true })
nmap("<leader>ds", function() ui.centered_float(ui.scopes) end, { silent = true })

local load_setting = function(langtype)
  local config = require("plugins.nvim-dap." .. langtype)
  dap.adapters[langtype] = config.adapter
  dap.configurations[langtype] = config.client
end

utils.iterate_child_modules(debug.getinfo(1, "S"), load_setting)
