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
    {
        "ruifm/gitlinker.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            local status_ok, gitlinker = pcall(require, "gitlinker")
            if not status_ok then
                return
            end

            gitlinker.setup()

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
        lazy = false,
        keys = {
            { "<Leader>gb", ":GitBlameToggle<CR>", desc = "Toggle Git Blame", silent = true },
            { "<Leader>gbo", ":GitBlameOpenCommitURL<CR>", desc = "Open Commit URL ", silent = true },
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
