local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup{
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
        ["<C-h>"] = "which_key"
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
        file_ignore_patterns = {
          "%.png",
          "%.jpg",
          "%.webp",
          "node_modules",
          "*%.min%.*",
          "dotbot",
        },
    },
  },
  extensions = {
      fzf = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },
  }
}

telescope.load_extension('fzf')
