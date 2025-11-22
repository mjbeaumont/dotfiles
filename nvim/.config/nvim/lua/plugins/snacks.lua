return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = {
            enabled = true,
        },
        -- gh = {
        --     enabled = true,
        -- },
        image = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        picker = {
            --enabled = false,
            ui_select = true,
            sources = { explorer = { hidden = true }, files = { hidden = true } },
            win = { list = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } }, ["<c-h>"] = "explorer_up" } } },
        },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            "<Leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Open Files",
        },
        {
            "<Leader>fo",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Find Open Files",
        },
        {
            "<Leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<Leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Live Grep",
        },
        {
            "<Leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent",
        },
        {
            "<Leader>fd",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>gp",
            function()
                Snacks.picker.gh_pr()
            end,
            desc = "View Pull Requests"
        },
        {
            "<leader>bf",
            function()
                Snacks.explorer()
            end,
            desc = "Lazygit",
        },
    },
}
