### Adding new language servers

1. Add `vim.lsp.enable("lsp_name")` to `/lua/core/lsp/init.lua`
2. Add a file with the same name to `/lsp` with any overrides from the `nvim-lspconfig` defaults
3. (Optional) If there are any custom actions needed when the LSP client attaches, add code to `/lua/core/lsp/on_attach.lua`
