return {
    "voldikss/vim-floaterm",
    init = function()
        vim.g.floaterm_keymap_toggle = "<F1>"
        vim.g.floaterm_height = 0.9
        vim.g.floaterm_width = 0.9
    end,
    lazy = true,
    config = function() end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    keys = {
        { "<Leader>ph", ":FloatermNew htop<CR>", { desc = "Open htop" } },
        { "<Leader>pn", ":FloatermNew ts-node<CR>", { desc = "Open TypeScript REPL" } },
        { "<Leader>pe", ":FloatermNew --autoclose=0 ts-node %<CR>", { desc = "Open Current File" } },
        { "<Leader>pt", ":FloatermToggle<CR>", { desc = "Open Terminal" } },
        { "<Leader>pd", ":FloatermNew lazydocker<CR>", { desc = "Open Lazy Docker" } },
    },
}
