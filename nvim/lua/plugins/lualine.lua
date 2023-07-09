require("lualine").setup({
  sections = {
    lualine_c = {
      {
        "filename",
        path = 1,
      },
      "navic",
      "lsp_progress",
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
