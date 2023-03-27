require("kanagawa").setup({
  overrides = function(colors)
    return {
      Visual = {
        bg = colors.palette.boatYellow1,
      },
    }
  end,
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none",
        },
      },
    },
  },
})
