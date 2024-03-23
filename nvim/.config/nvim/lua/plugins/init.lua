return {
    -- My plugins here
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

    -- enhanced vim keymaps/motions
    "ggandor/leap.nvim",
    "tpope/vim-abolish",
    "tpope/vim-commentary",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "wellle/targets.vim",
    { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" }, -- buffer tabs
    "moll/vim-bbye",

    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup({
                sign_priority = 100,
            })
        end,
    },
    "echasnovski/mini.files",
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icon
        },
    },
    "kdheepak/lazygit.nvim",
    {
        "ruifm/gitlinker.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    "f-person/git-blame.nvim",

    -- ColorschemesO
    {
        "Iron-E/nvim-highlite",
        config = function()
            -- or one of the alternate colorschemes (see the "Built-in Colorschemes" section)
            vim.api.nvim_command("colorscheme highlite")
        end,
        lazy = false,
        priority = math.huge,
        version = "3.1.0",
    },

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
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("octo").setup({ suppress_missing_scope = {
                project_v2 = true,
            } })
        end,
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
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-project.nvim",
    "camgraff/telescope-tmux.nvim",

    -- Tests
    "vim-test/vim-test",

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "mfussenegger/nvim-ts-hint-textobject",
    {
        "chrisgrieser/nvim-various-textobjs",
        config = function()
            require("various-textobjs").setup({ useDefaultKeymaps = true })
        end,
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
