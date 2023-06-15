local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

    -- enhanced vim keymaps/motions
    use("ggandor/leap.nvim")
    use("tpope/vim-abolish")
    use("tpope/vim-commentary")
    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    use("wellle/targets.vim")
    use({ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" }) -- buffer tabs
    use({ "goolord/alpha-nvim", requires = "nvim-tree/nvim-web-devicons" }) -- buffer tabs
    use("moll/vim-bbye")

    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup({
                sign_priority = 100,
            })
        end,
    })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icon
        },
    })
    use("kdheepak/lazygit.nvim")
    use({
        "ruifm/gitlinker.nvim",
        requires = "nvim-lua/plenary.nvim",
    })
    use("f-person/git-blame.nvim")

    -- ColorschemesO
    use("Iron-E/nvim-highlite")

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp-signature-help")
    use("hrsh7th/cmp-path") -- add filesystem path completion
    use({
        "David-Kunz/cmp-npm",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use({
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("octo").setup()
        end,
    })
    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("b0o/schemastore.nvim")
    use("mhartington/formatter.nvim")
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })
    use("kosayoda/nvim-lightbulb")
    use("folke/trouble.nvim")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-project.nvim")
    use("camgraff/telescope-tmux.nvim")

    -- Tests
    use("vim-test/vim-test")
    use("voldikss/vim-floaterm")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("RRethy/nvim-treesitter-textsubjects")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("mfussenegger/nvim-ts-hint-textobject")
    use({
        "chrisgrieser/nvim-various-textobjs",
        config = function()
            require("various-textobjs").setup({ useDefaultKeymaps = true })
        end,
    })
    -- Debugging
    use("mfussenegger/nvim-dap")
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
    use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
    use({
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    })
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
