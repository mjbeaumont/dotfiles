return {
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "wellle/targets.vim",
    "moll/vim-bbye",
    {
        "mfussenegger/nvim-treehopper",
        keys = {
            {
                "m",
                ":<C-U>lua require('tsht').nodes()<CR>",
                noremap = false,
                silent = true,
            },
            {
                "m",
                ":lua require('tsht').nodes()<CR>",
                silent = true,
            },
        },
    },
}
