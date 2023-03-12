local neogit = require("neogit")
neogit.setup({
  integrations = {
    diffview = true,
  },
  mappings = {
    status = {
      ["P"] = "",
      ["p"] = "PushPopup",
      ["C"] = "NeogitCommitPopup--no-verify",
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
