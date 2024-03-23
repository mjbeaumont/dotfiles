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
            })
        end,
    },
    "kdheepak/lazygit.nvim",
    {
        "ruifm/gitlinker.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local status_ok, gitlinker = pcall(require, "gitlinker")
            if not status_ok then
                return
            end

            gitlinker.setup()

            vim.api.nvim_set_keymap(
                "n",
                "<leader>go",
                '<cmd>lua require"gitlinker".get_repo_url()<cr>',
                { silent = true, desc = "Open line in GitHub" }
            )
            -- can't use keys here because this command exceeds the max LHS length limit
            vim.api.nvim_set_keymap(
                "n",
                "<leader>go",
                '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>',
                { silent = true, desc = "Open Line in Github" }
            )
        end,
    },
    {
        "f-person/git-blame.nvim",
        keys = {
            { "<Leader>gb", ":GitBlameToggle<CR>", desc = "Toggle Git Blame" },
            { "<Leader>gbo", ":GitBlameOpenCommitURL<CR>", desc = "Open Commit URL " },
        },
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("octo").setup({ suppress_missing_scope = {
                project_v2 = true,
            } })
        end,
        keys = {
            {
                "<Leader>or",
                ":Octo search is:pr is:open review-requested:@me archived:false<CR>",
                desc = "Open PR Review Requests",
            },
            {
                "<Leader>om",
                ":Octo search is:pr is:open author:@me archived:false<CR>",
                desc = "Open My PRs",
            },
            {
                "<Leader>oc",
                ":Octo search is:pr is:open commenter:@me archived:false<CR>",
                desc = "Open PR Discussions",
            },
        },
    },
}
