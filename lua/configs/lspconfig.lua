require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

local lspconfig = require("lspconfig")
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- C/C++ Setup
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Go Setup
lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
-- read :h vim.lsp.config for changing options of lsp servers 
