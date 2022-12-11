local utils = require "utils"

local optional_lsp_option = function(v) return utils.optional_value(v, {}) end

local start_lsp_server = function(command, optional_args)
  local args = optional_lsp_option(optional_args)
  local command_args = optional_lsp_option(args.command_args)
  local root_path_detectors = optional_lsp_option(args.root_path_detectors)
  local init_options = optional_lsp_option(args.init_options)

  vim.lsp.start({
    name = command,
    cmd = utils.attach_array(command, command_args),
    root_dir = vim.fs.dirname(vim.fs.find(root_path_detectors, {upward = true})[1]),
    init_options = init_options,
  })
end

local make_setting = function(exts, command, optional_args)
  return {
    exts = utils.map_array(exts, function(v) return "*." .. v end),
    command = command,
    lsp = function()
      start_lsp_server(command, optional_args)
      utils.nmap("gd", vim.lsp.buf.type_definition)
      utils.namp("gh", vim.lsp.buf.hover)
    end,
  }
end

local haskell = make_setting({"hs", "lhs"}, "haskell-language-server", {root_path_detectors={"*.cabal"}})
local nix = make_setting({"nix"}, "rnix-lsp")

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
  setup(settings[i])
end
