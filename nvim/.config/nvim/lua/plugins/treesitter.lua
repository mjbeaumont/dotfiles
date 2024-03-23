return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end

        configs.setup({
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
                "rust",
                "scss",
                "todotxt",
                "tsx",
                "typescript",
                "vim",
                "vue",
                "yaml",
            }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            auto_install = true,
            sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
            ignore_install = { "" }, -- List of parsers to ignore installing
            playground = {
                enable = true,
                disable = {},
                updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                persist_queries = false,
                keybindings = {
                    toggle_query_editor = "o",
                    toggle_hl_groups = "i",
                    toggle_injected_languages = "t",
                    toggle_anonymous_nodes = "a",
                    toggle_language_display = "I",
                    focus_language = "f",
                    unfocus_language = "F",
                    update = "R",
                    goto_node = "<cr>",
                    show_help = "?",
                },
            },
            autopairs = {
                enable = true,
            },
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true, disable = { "yaml" } },
            lsp_interop = {
                enable = true,
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
            textobjects = {
                select = {
                    enable = true,

                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,

                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
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
                prev_selection = ",", -- (Optional) keymap to select the previous selection
                keymaps = {
                    ["."] = "textsubjects-smart",
                    [";"] = "textsubjects-container-outer",
                    ["i;"] = "textsubjects-container-inner",
                },
            },
        })

        local status_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring")
        if not status_ok then
            return
        end

        ts_context_commentstring.setup({
            enable_autocmd = false,
        })
    end,
},
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "mfussenegger/nvim-ts-hint-textobject",
    {
        "chrisgrieser/nvim-various-textobjs",
        config = function()
            local status_ok, various_textobjs = pcall(require, "various-textobjs")
            if not status_ok then
                return
            end

            various_textobjs.setup({ useDefaultKeymaps = true })
        end,
    }
