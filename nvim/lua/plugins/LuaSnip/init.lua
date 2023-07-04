local utils = require("utils")
local luasnip = require("luasnip")
luasnip.setup({})

local register = function(snip)
  luasnip.add_snippets(snip, require("plugins.LuaSnip." .. snip))
end

utils.iterate_child_modules(debug.getinfo(1, "S"), register)
