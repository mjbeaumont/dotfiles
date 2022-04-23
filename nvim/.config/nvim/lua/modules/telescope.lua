local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require("telescope.actions")
local set_km = require("modules.utils")

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

set_km("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
set_km("n", "<Leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>")
set_km("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
set_km("n", "<Leader>ft", ":lua require('telescope.builtin').treesitter()<CR>")
set_km("n", "<Leader>fo", ":lua require('telescope.builtin').buffers()<CR>")
set_km("n", "<Leader>fr", ":lua require('telescope.builtin').oldfiles()<CR>")
set_km("n", "<Leader>fs", ":lua require('telescope.builtin').lsp_document_symbols()<CR>")

set_km("n", "<Leader>fw", ":Telescope tmux windows<CR>")
set_km("n", "<Leader>fx", ":Telescope tmux sessions<CR>")
