return {
    {
        "williamboman/mason.nvim",
        config = function()
            local status_ok, mason = pcall(require, "mason")

            if not status_ok then
                return
            end

            mason.setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local status_ok, mason_lspconfig = pcall(require, "mason")

            if not status_ok then
                return
            end

            mason_lspconfig.setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "jose-elias-alvarez/nvim-lsp-ts-utils" },
        config = function(_, opts)
            local status_ok, lspconfig = pcall(require, "lspconfig")

            if not status_ok then
                return
            end

            local lsp_settings = require("modules.lsp")
            local eslint = require("modules.lsp.eslint")
            local tsserver = require("modules.lsp.tsserver")
            local lua_ls = require("modules.lsp.lua_ls")

            lsp_settings.setup()

            lspconfig.eslint.setup(eslint.getOpts(opts.on_attach, opts.capabilities))
            lspconfig.tsserver.setup(tsserver.getOpts(opts.on_attach, opts.capabilities))
            lspconfig.lua_ls.setup(lua_ls.getOpts())
        end,
    },
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    "b0o/schemastore.nvim",
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
    },
}
