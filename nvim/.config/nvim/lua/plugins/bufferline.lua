return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.g.floaterm_keymap_toggle = "<F1>"
        vim.g.floaterm_height = 0.9
        vim.g.floaterm_width = 0.9
    end,
    lazy = true,
    config = function()
        local status_ok, bufferline = pcall(require, "bufferline")
        if not status_ok then
            return
        end

        bufferline.setup({
            options = {
                -- NOTE: this plugin is designed with this icon in mind,
                -- and so changing this is NOT recommended, this is intended
                -- as an escape hatch for people who cannot bear it for whatever reason
                numbers = "ordinal",
            },
        })
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        { "<Leader>bs", ":BufferLinePick<CR>" },
    },
}
