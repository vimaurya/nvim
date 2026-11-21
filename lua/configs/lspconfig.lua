require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" , "rust_analyzer", "clangd", "gopls"}
vim.lsp.enable(servers)
