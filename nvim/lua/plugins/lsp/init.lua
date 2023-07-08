local navbuddy = require("nvim-navbuddy")
local navic = require("nvim-navic")
local utils = require("utils")
local nmap = utils.nmap


local setup_diagnostic_signs = function()
  local signs = { Error = "", Warning = "", Info = "", Hint = "󰌵" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local setup_keymaps = function(bufnr)
  nmap("<space>e", vim.diagnostic.open_float, { silent = true })
  nmap("[d", vim.diagnostic.goto_prev, { silent = true })
  nmap("]d", vim.diagnostic.goto_next, { silent = true })
  nmap("gD", vim.lsp.buf.declaration, { silent = true, buffer = bufnr })
  nmap("gd", vim.lsp.buf.definition, { silent = true, buffer = bufnr })
  nmap("K", vim.lsp.buf.hover, { silent = true, buffer = bufnr })
  nmap("gi", vim.lsp.buf.implementation, { silent = true, buffer = bufnr })
  nmap("g<C-k>", vim.lsp.buf.signature_help, { silent = true, buffer = bufnr })
  nmap("<space>wa", vim.lsp.buf.add_workspace_folder, { silent = true, buffer = bufnr })
  nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, { silent = true, buffer = bufnr })
  nmap("<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { silent = true, buffer = bufnr })
  nmap("<space>D", vim.lsp.buf.type_definition, { silent = true, buffer = bufnr })
  nmap("<space>rn", vim.lsp.buf.rename, { silent = true, buffer = bufnr })
  nmap("<space>ca", vim.lsp.buf.code_action, { silent = true, buffer = bufnr })
  nmap("<space>f", function() vim.lsp.buf.format { async = true } end, { silent = true, buffer = bufnr })
  nmap("<leader>.", navbuddy.open, { silent = true })
end

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  if client.server_capabilities.documentSymbolProvider then
    navbuddy.attach(client, bufnr)
    navic.attach(client, bufnr)
  end

  setup_diagnostic_signs()
  setup_keymaps(bufnr)
end

local lsp_flags = {
  debounce_text_changes = 150
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

M = {}

M.make_config = function(server_info)
  return {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = server_info.settings,
    capabilities = capabilities,
  }
end

M.make_lspconfig = function(server_info)
  local config = M.make_config(server_info)
  if server_info.cmd ~= nil then
    config.cmd = server_info.cmd
  end
  require("lspconfig")[server_info.servername].setup(config)
end

return M
