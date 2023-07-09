require("lualine").setup({
  sections = {
    lualine_c = {
      {
        "filename",
        path = 1,
      },
      "navic",
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },
  },
})
