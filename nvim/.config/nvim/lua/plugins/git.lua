return {
    {
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
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 200,
                    virt_text_pos = "eol",
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            })
        end,
        keys = {
            { "<Leader>gbt", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Line Blame", silent = true },
        },
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        picker = "snacks",
        config = function()
            require("octo").setup({ suppress_missing_scope = {
                project_v2 = true,
            } })
        end,
        cmd = "Octo",
        keys = {
            {
                "<Leader>gm",
                ":Octo search is:pr is:open author:@me archived:false<CR>",
                desc = "Open My PRs",
            },
            {
                "<Leader>gc",
                ":Octo search is:pr is:open commenter:@me archived:false<CR>",
                desc = "Open PR Discussions",
            },
        },
    },
}
