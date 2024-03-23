return {
    -- My plugins here
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

    -- enhanced vim keymaps/motions
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "wellle/targets.vim",
    "moll/vim-bbye",

    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    },
    "kosayoda/nvim-lightbulb",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = { use_diagnostic_signs = true },
    },

    -- Debugging
    "mfussenegger/nvim-dap",
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
    { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
    {
        "microsoft/vscode-js-debug",
        opt = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
}
