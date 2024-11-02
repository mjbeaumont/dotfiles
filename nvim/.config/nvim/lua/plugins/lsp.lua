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
        config = function()
            local status_ok, lspconfig = pcall(require, "lspconfig")

            if not status_ok then
                return
            end

            local lsp_settings = require("modules.lsp")
            local eslint = require("modules.lsp.eslint")
            local ts_ls = require("modules.lsp.ts_ls")
            local lua_ls = require("modules.lsp.lua_ls")
            local jsonls = require("modules.lsp.jsonls")
            local yamlls = require("modules.lsp.yamlls")

            lsp_settings.setup()

            lspconfig.eslint.setup(eslint.getOpts(lsp_settings.on_attach, lsp_settings.capabilities))
            lspconfig.ts_ls.setup(ts_ls.getOpts(lsp_settings.on_attach, lsp_settings.capabilities))
            lspconfig.jsonls.setup(jsonls.getOpts(lsp_settings.on_attach, lsp_settings.capabilities))
            lspconfig.yamlls.setup(yamlls.getOpts(lsp_settings.on_attach, lsp_settings.capabilities))
            lspconfig.lua_ls.setup(lua_ls.getOpts())
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pyflakes = { enabled = true },
                            pylint = { enabled = true },
                            black = { enabled = true },
                            isort = { enabled = true },
                            jedi = { enabled = true },
                        },
                    },
                },
                server = {
                    on_attach = lsp_settings.on_attach,
                    capabilities = lsp_settings.capabilities,
                },
            })
            vim.g.rustaceanvim = {
                server = {
                    on_attach = lsp_settings.on_attach,
                    capabilities = lsp_settings.capabilities,
                },
            }
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function()
                    local bufmap = function(mode, lhs, rhs)
                        local opts = { buffer = true, noremap = true, silent = true }
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    bufmap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
                    bufmap("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
                    bufmap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
                    bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
                    bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
                    bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
                    bufmap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
                    bufmap("n", "ga", "<cmd>:CodeActionMenu<CR>")
                    bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>")
                    bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
                    bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>")
                end,
            })
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
