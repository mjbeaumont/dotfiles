return {
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "kylechui/nvim-surround",
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
