return {

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
    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    },
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
        end,
    },
}
