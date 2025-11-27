return {
    -- Treesitter-based text objects
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                },
            },
            textsubjects = {
                enable = true,
                prev_selection = ",",
                keymaps = {
                    ["."] = "textsubjects-smart",
                    [";"] = "textsubjects-container-outer",
                    ["i;"] = "textsubjects-container-inner",
                },
            },
        },
    },
    "RRethy/nvim-treesitter-textsubjects",

    -- Additional text object plugins
    "echasnovski/mini.ai",
    "wellle/targets.vim",
    {
        "chrisgrieser/nvim-various-textobjs",
        event = "VeryLazy",
        opts = {
            keymaps = {
                useDefaults = true,
            },
        },
    },
    {
        "mfussenegger/nvim-treehopper",
        keys = {
            { "m", [[:<C-u>lua require('tsht').nodes()<CR>]], mode = "o", silent = true },
            { "m", [[:lua require('tsht').nodes()<CR>]], mode = "x", silent = true },
        },
    },
}
