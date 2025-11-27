return {

    {
        "dmmulroy/ts-error-translator.nvim",
        opts = {},
    },
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
        end,
    },
}
