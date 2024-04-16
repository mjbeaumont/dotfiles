return {
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local status_ok, telescope = pcall(require, "telescope")
            if not status_ok then
                return
            end

            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<ESC>"] = actions.close,
                            ["<C-h>"] = "which_key",
                        },
                        n = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
                pickers = {
                    -- Default configuration for builtin pickers goes here:
                    find_files = {
                        hidden = true,
                        file_ignore_patterns = {
                            "%.png",
                            "%.jpg",
                            "%.webp",
                            "node_modules",
                            "*%.min%.*",
                            ".git/",
                        },
                    },
                    live_grep = {
                        on_input_filter_cb = function(prompt)
                            return { prompt = prompt:gsub("%s", ".*") }
                        end,
                    },
                },
                extensions = {
                    fzf = {
                        override_generic_sorter = true,
                        override_file_sorter = true,
                    },
                    project = {
                        base_paths = {
                            { "~/Code/TFD" },
                        },
                        hidden_files = true,
                    },
                },
            })

            telescope.load_extension("fzf")
            telescope.load_extension("project")
        end,
        keys = {
            {
                "<Leader>ff",
                ":lua require('telescope.builtin').find_files()<CR>",
                desc = "Find Files",
                silent = true,
            },

            {
                "<Leader>fp",
                ":lua require'telescope'.extensions.project.project{}<CR>",
                desc = "Find Projects",
                silent = true,
            },

            {
                "<Leader>fo",
                ":lua require('telescope.builtin').buffers()<CR>",
                desc = "Find Open Files",
                silent = true,
            },

            {
                "<Leader>fg",
                ":lua require('telescope.builtin').live_grep()<CR>",
                desc = "Find Text",
                silent = true,
            },

            {
                "<Leader>ft",
                ":lua require('telescope.builtin').treesitter()<CR>",
                desc = "Find Treesitter",
                silent = true,
            },

            {
                "<Leader>fr",
                ":lua require('telescope.builtin').oldfiles()<CR>",
                desc = "Find Recent",
                silent = true,
            },

            {
                "<Leader>fs",
                ":lua require('telescope.builtin').lsp_document_symbols()<CR>",
                desc = "Find Symbols",
                silent = true,
            },

            {
                "<Leader>fw",
                ":Telescope tmux windows<CR>",
                desc = "Find Tmux Window",
                silent = true,
            },
            {
                "<Leader>fx",
                ":Telescope tmux sessions<CR>",
                desc = "Find Tmux Session",
                silent = true,
            },
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
    "camgraff/telescope-tmux.nvim",
}
