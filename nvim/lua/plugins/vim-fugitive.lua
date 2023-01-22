local utils = require("utils")
local vmap = utils.vmap

local detect_opener = function()
  if vim.fn.has("wsl") == 1 then
    return "explorer.exe"
  elseif vim.fn.has("mac") == 1 then
    return "open"
  elseif vim.fn.has("unix") == 1 then
    return "xdg-open"
  end
end

vim.api.nvim_create_user_command("Browse", function(params)
  local url = params.args:gsub("#", "\\#")
  local opener = detect_opener()
  vim.fn.execute("!" .. opener .. " " .. url)
end, {
  nargs = 1,
})
vmap("<leader>g", ":GBrowse<CR>")
