return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
        config = function()
            local lsp_settings = require("modules.lsp")

            lsp_settings.setup()

            vim.g.rustaceanvim = {
                server = {
                    on_attach = lsp_settings.on_attach,
                    capabilities = lsp_settings.capabilities,
                },
            }
        end,
    },
    {
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        keys = { { "<Leader>gi", ":TSLspImportAll<CR>", silent = true, desc = "Import All" } },
    },
    "b0o/schemastore.nvim",
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
    },
}
