return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "dockerfile",
                    "graphql",
                    "html",
                    "http",
                    "javascript",
                    "jsdoc",
                    "json",
                    "json5",
                    "lua",
                    "php",
                    "prisma",
                    "python",
                    "regex",
                    "rust",
                    "scss",
                    "todotxt",
                    "tsx",
                    "typescript",
                    "vim",
                    "vue",
                    "yaml",
                },
                auto_install = true,
                sync_install = false,
                ignore_install = { "" },
                autopairs = {
                    enable = true,
                },
                highlight = {
                    enable = true,
                    disable = { "" },
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true, disable = { "yaml" } },
                lsp_interop = {
                    enable = true,
                    peek_definition_code = {
                        ["<leader>df"] = "@function.outer",
                        ["<leader>dF"] = "@class.outer",
                    },
                },
            })
        end,
        keys = {
            { "<Leader>hl", ":Inspect<CR>", desc = "Show Highlight Under Cursor" },
        },
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
            enable_autocmd = false,
        },
    },
}
