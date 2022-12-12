local utils = require "utils"

local optional_lsp_option = function(v) return utils.optional_value(v, {}) end

local start_lsp_server = function(name, command, optional_args)
  local args = optional_lsp_option(optional_args)
  local root_path_detectors = optional_lsp_option(args.root_path_detectors)
  local init_options = optional_lsp_option(args.init_options)

  vim.lsp.start({
    name = name,
    cmd = command,
    root_dir = vim.fs.dirname(vim.fs.find(root_path_detectors, {upward = true})[1]),
    init_options = init_options,
  })
end

local make_setting = function(exts, name, command, optional_args)
  return {
    exts = utils.map_array(exts, function(v) return "*." .. v end),
    command = command[1],
    lsp = function()
      utils.nmap("gd", vim.lsp.buf.type_definition)
      utils.nmap("gh", vim.lsp.buf.hover)
      start_lsp_server(name, command, optional_args)
    end,
  }
end

local haskell = make_setting({"hs", "lhs"}, "haskell-lsp", {"haskell-language-server-wrapper", "--lsp"}, {root_path_detectors = {"*.cabal"}})
local nix = make_setting({"nix"}, "nix-lsp", {"rnix-lsp"})

local setup = function(setting)
  if (vim.fn["executable"](setting.command) == 0) then
    return
  end
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = setting.exts,
    callback = setting.lsp,
  })
end

local settings = {
  haskell,
  nix
}

for i=1,#settings,1 do
  local setting = settings[i]
  if (vim.fn["executable"](setting.command) == 0) then
    goto continue
  end
  print("start lsp server: " .. setting.command)
  setup(setting)
  ::continue::
end
