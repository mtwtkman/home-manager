local default_colors = require("kanagawa.colors").setup()
local overrides = {
  Visual = { bg = default_colors.sumiInk0 },
}

require("kanagawa").setup({
  overrides = overrides,
})
