require("navigator").setup({
  lsp = {
    disable_lsp = {
      "hls",
      "jdtls"
    },
  },
  keymaps = {
    { key = "gt", func = function() vim.fn.execute("tabn") end, desc = "avoid conflict gt" }
  },
  icons = {
    icons = true,
    code_action_icon = "",
    code_lens_action_icon = "󰊪",
    diagnostic_head = "󰛯",
    diagnostic_err = "",
    diagnostic_warn = "",
    diagnostic_info = "",
    diagnostic_hint = "󰘥",
    diagnostic_head_severity_1 = "",
    diagnostic_head_severity_2 = "",
    diagnostic_head_severity_3 = "",
    diagnostic_head_description = "-",
    diagnostic_virtual_text = "",
    diagnostic_file = "",
    value_definition = "",
    value_changed = "",
    match_kinds = {
      associated = "󰌷",
      namespace = "",
      field = "",
      module = "",
      flag = "",
    },
    treesitter_defult = "",
  },
})
