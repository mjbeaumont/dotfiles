return {
    -- Core treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-textsubjects",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "dockerfile",
                    "graphql",
                    "html",
                    "http",
                    "javascript",
                    "jsdoc",
                    "json",
                    "json5",
                    "lua",
                    "php",
                    "prisma",
                    "python",
                    "regex",
                    "rust",
                    "scss",
                    "todotxt",
                    "tsx",
                    "typescript",
                    "vim",
                    "vue",
                    "yaml",
                },
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true, disable = { "yaml" } },
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
            })
        end,
        keys = {
            { "<Leader>hl", ":Inspect<CR>", desc = "Show Highlight Under Cursor" },
        },
    },

    -- Context at top of screen
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            max_lines = 3,
        },
    },

    -- Context-aware comments (e.g., JSX vs JS in TSX files)
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
            enable_autocmd = false,
        },
    },

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
