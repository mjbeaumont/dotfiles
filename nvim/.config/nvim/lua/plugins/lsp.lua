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
