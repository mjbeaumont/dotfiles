return {
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lint = require("lint")

            local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"
            lint.linters.jsonlint.cmd = mason_bin .. "jsonlint"

            lint.linters_by_ft = {
                json = { "jsonlint" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
}
