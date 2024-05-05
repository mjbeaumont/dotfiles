return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-telescope/telescope.nvim" },
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            return
        end

        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "  Find project", ":lua require'telescope'.extensions.project.project{}<CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("q", "Quit Neovim", ":qa<CR>"),
        }
        dashboard.section.footer.val = "Patrick"

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
    keys = {
        {
            "<Leader>a",
            ":Alpha<CR>",
            desc = "Open Alpha",
            silent = true,
        },
    },
}
