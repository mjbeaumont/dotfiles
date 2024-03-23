return {

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { use_diagnostic_signs = true },
        keys = {
            {
                "<Leader>xx",
                ":TroubleToggle<CR>",
                desc = "Open Trouble",
                silent = true,
            },
            {
                "<Leader>xw",
                ":TroubleToggle workspace_diagnostics<CR>",
                desc = "Open Workspace Diagnostics",
                silent = true,
            },
            {
                "<Leader>xd",
                ":TroubleToggle document_diagnostics<CR>",
                desc = "Open Document Diagnostics",
                silent = true,
            },
            {
                "<Leader>xq",
                ":TroubleToggle quickfix<CR>",
                desc = "Toggle Trouble Quickfix List",
                silent = true,
            },
            {
                "<Leader>xl",
                ":TroubleToggle loclist<CR>",
                desc = "Toggle Trouble Location List",
                silent = true,
            },
            {
                "gR",
                ":TroubleToggle lsp_references<CR>",
                desc = "Trouble LSP Referenes",
                silent = true,
            },
        },
    },

    {
        "dmmulroy/ts-error-translator.nvim",
        config = function()
            local status_ok, ts_error_translator = pcall(require, "ts-error-translator")

            if not status_ok then
                return
            end

            ts_error_translator.setup()
        end,
    },
}
