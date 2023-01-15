local utils = require("utils")
local nmap = utils.nmap

nmap("<space>e", vim.diagnostic.open_float, { silent = true })
nmap("[d", vim.diagnostic.goto_prev, { silent = true })
nmap("]d", vim.diagnostic.goto_next, { silent = true })
nmap("<space>q", vim.diagnostic.setloclist, { silent = true })

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  nmap("gD", vim.lsp.buf.declaration, { silent = true, buffer = bufnr })
  nmap("gd", vim.lsp.buf.definition, { silent = true, buffer = bufnr })
  nmap("K", vim.lsp.buf.hover, { silent = true, buffer = bufnr })
  nmap("gi", vim.lsp.implementation.signatrue_help, { silent = true, buffer = bufnr })
  nmap("g<C-k>", vim.lsp.buf.signature_help, { silent = true, buffer = bufnr })
  nmap("<space>wa", vim.lsp.buf.add_workspace_folder, { silent = true, buffer = bufnr })
  nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, { silent = true, buffer = bufnr })
  nmap("<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { silent = true, buffer = bufnr })
  nmap("<space>D", vim.lsp.buf.type_definition, { silent = true, buffer = bufnr })
  nmap("<space>rn", vim.lsp.buf.rename, { silent = true, buffer = bufnr })
  nmap("<space>ca", vim.lsp.buf.code_action, { silent = true, buffer = bufnr })
  nmap("gr", vim.lsp.buf.references, { silent = true, buffer = bufnr })
  nmap("<space>f", function() vim.lsp.buf.format { async = true } end, { silent = true, buffer = bufnr })
end

local lsp_flags = {
  debounce_text_changes = 150
}

local lspconfig = require("lspconfig")

local configure_lsp = function(langtype)
  local server_info = require("plugins.nvim-lspconfig." .. langtype)
  lspconfig[server_info.servername].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = utils.optional_value(server_info.settings, {}),
  }
end

configure_lsp("haskell")
configure_lsp("nix")
