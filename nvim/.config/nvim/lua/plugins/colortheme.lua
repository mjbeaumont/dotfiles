return {
    "Iron-E/nvim-highlite",
    config = function()
        -- or one of the alternate colorschemes (see the "Built-in Colorschemes" section
        vim.api.nvim_command("colorscheme custom")
    end,
    lazy = false,
    priority = math.huge,
}
