local utils = require("utils")
local dap = require("dap")

local load_setting = function(langtype)
  require("plugins.nvim-dap." .. langtype).setup(dap)
end

utils.iterate_child_modules(debug.getinfo(1, "S"), load_setting)
