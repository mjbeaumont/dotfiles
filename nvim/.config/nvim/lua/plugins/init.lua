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

    -- cmp plugins
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path", -- add filesystem path completion
    {
        "David-Kunz/cmp-npm",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
    },
    -- snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    "b0o/schemastore.nvim",
    "mhartington/formatter.nvim",
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
