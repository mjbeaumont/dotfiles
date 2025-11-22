local utils = require("core/lsp/utils")
local M = {}

M.setup = function()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("CustomLspAttach", { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            local bufnr = args.buf

            -- Example: print the client name for debugging
            -- vim.notify("LSP attached: " .. client.name)
            if not client then
                vim.notify("LspAttach: client is nil!", vim.log.levels.WARN)
                return
            end
            -- Disable semantic tokens for all clients
            if client.server_capabilities.semanticTokensProvider then
                client.server_capabilities.semanticTokensProvider = nil
            end

            -- Buffer-local keymap helper
            local function map(mode, lhs, rhs)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
            end

            -- === Generic formatting keymap ===
            if client.server_capabilities.documentFormattingProvider then
                map("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end)
            end

            -- Example Snacks picker keymaps
            map("n", "gr", function()
                require("snacks.picker").lsp_references()
            end)
            map("n", "gd", function()
                require("snacks.picker").lsp_definitions()
            end)
            map("n", "gi", function()
                require("snacks.picker").lsp_implementations()
            end)

            map("n", "gh", function()
                vim.diagnostic.open_float(nil, {
                    focusable = true,
                    scope = "line",
                    close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" },
                })
            end)

            map("n", "gD", function()
                vim.lsp.buf.declaration()
            end)
            map("n", "gs", function()
                vim.lsp.buf.signature_help()
            end)
            map("n", "K", function()
                vim.lsp.buf.hover()
            end)
            -- Standard keymaps
            map("n", "<leader>rn", vim.lsp.buf.rename)
            map("n", "ga", vim.lsp.buf.code_action)

            -- highlight references to the symbol you are hovering over
            if client.server_capabilities.documentHighlightProvider then
                local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = false })

                vim.api.nvim_create_autocmd("CursorHold", {
                    group = group,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.document_highlight()
                    end,
                })

                vim.api.nvim_create_autocmd("CursorMoved", {
                    group = group,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.clear_references()
                    end,
                })
            end -- Optional: eslint fix on save

            if client.name == "eslint" then
                vim.api.nvim_create_autocmd("BufWritePost", {
                    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
                    command = "silent! EslintFixAll",
                })
            end
        end,
    })
end

return M
