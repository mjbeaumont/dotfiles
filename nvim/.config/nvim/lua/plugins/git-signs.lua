return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local status_ok, gitsigns = pcall(require, "gitsigns")
        if not status_ok then
            return
        end

        gitsigns.setup({
            sign_priority = 100,
        })
    end,
}
