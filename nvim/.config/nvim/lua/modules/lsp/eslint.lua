local M = {
    setup = function(on_attach, capabilities)
        local lspconfig = require("lspconfig")
        local opts = { silent = true, noremap = true }

        lspconfig["eslint"].setup({
            root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js"),
            on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = true
                on_attach(client, bufnr)
                vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-l>", ":EslintFixAll<CR>", opts)
            end,
            capabilities = capabilities,
            settings = {
                format = {
                    enable = true,
                },
            },
        })
    end,
}

return M
