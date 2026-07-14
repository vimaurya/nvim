local lspconfig = require("lspconfig")

lspconfig.gopls.setup {
  settings = {
    gopls = {
      gofumpt = true,
    },
  },
}
