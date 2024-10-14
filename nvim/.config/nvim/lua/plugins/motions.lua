return {
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    "wellle/targets.vim",
    "moll/vim-bbye",
    {
        "mfussenegger/nvim-treehopper",
        config = function()
            vim.keymap.set("o", "m", [[:<C-u>lua require('tsht').nodes()<CR>]], { silent = true, remap = true })
            vim.keymap.set("x", "m", [[:lua require('tsht').nodes()<CR>]], { silent = true })
        end,
    },
}
