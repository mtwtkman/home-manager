local neogit = require("neogit")
neogit.setup({
  disable_hint = true,
  disable_commit_confirmation = true,
  integrations = {
    diffview = true,
  },
  mappings = {
    status = {
      ["P"] = "",
      ["p"] = "PushPopup",
      ["C"] = "NeogitCommitPopup--no-verify",
      ["o"] = "GoToFile",
      ["<Enter>"] = "Toggle",
    },
  },
})

vim.api.nvim_create_user_command(
  "G",
  function()
    neogit.open({
      kind = "split"
    })
  end,
  {}
)
