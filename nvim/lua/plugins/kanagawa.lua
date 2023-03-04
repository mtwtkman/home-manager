require("kanagawa").setup({
  overrides = function(colors)
    return {
      Visual = { bg = colors.palette.boatYellow1 }
    }
  end,
})
