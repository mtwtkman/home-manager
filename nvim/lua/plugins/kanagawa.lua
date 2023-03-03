local default_colors = require("kanagawa.colors").setup()
local overrides = {
  Visual = { bg = default_colors.boatYellow1 },
}

require("kanagawa").setup({
  overrides = overrides,
})
