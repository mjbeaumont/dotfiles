vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("jsonls")
vim.lsp.enable("yamlls")
vim.lsp.enable("pylsp")

require("core/lsp/on_attach").setup()
