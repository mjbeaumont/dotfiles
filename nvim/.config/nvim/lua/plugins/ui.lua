return {
    -- Colorscheme
    {
        "Iron-E/nvim-highlite",
        config = function()
            vim.api.nvim_command("colorscheme custom")
        end,
        lazy = false,
        priority = math.huge,
    },

    -- Buffer tabs
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = {
            options = {
                numbers = "ordinal",
            },
        },
        keys = {
            { "<Leader>bs", ":BufferLinePick<CR>", desc = "Pick Buffer" },
        },
    },

    -- Keybind help
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 750
        end,
        opts = {
            delay = 750,
            spec = {
                { "<leader>b", group = "Buffer" },
                { "<leader>d", group = "Debug" },
                { "<leader>f", group = "Find" },
                { "<leader>g", group = "Git" },
                { "<leader>o", group = "Open" },
                { "<leader>t", group = "Test" },
            },
        },
    },
}
