local ensure_installed = {
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
    "markdown",
    "markdown_inline",
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
}

-- Treesitter indent is still experimental and yaml is the worst offender.
local indent_disabled = { yaml = true }

return {
    -- Core treesitter. The `main` branch ships parsers and queries only —
    -- highlight and indent are Neovim features this config wires per filetype.
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            ts.install(ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
                callback = function(args)
                    local lang = vim.treesitter.language.get_lang(args.match) or args.match

                    -- Throws when the parser isn't installed. Install it so the next
                    -- open of this filetype is highlighted — replaces `auto_install`.
                    if not pcall(vim.treesitter.start, args.buf, lang) then
                        if vim.list_contains(ts.get_available(), lang) then
                            ts.install(lang)
                        end

                        return
                    end

                    if not indent_disabled[args.match] then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })

            vim.keymap.set("n", "<Leader>hl", ":Inspect<CR>", { desc = "Show Highlight Under Cursor" })
        end,
    },

    -- Syntax-aware text objects
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
                move = {
                    set_jumps = true,
                },
            })
        end,
        -- stylua: ignore
        keys = {
            { "af", mode = { "x", "o" }, function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end, desc = "Select Outer Function" },
            { "if", mode = { "x", "o" }, function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end, desc = "Select Inner Function" },
            { "ac", mode = { "x", "o" }, function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end, desc = "Select Outer Class" },
            { "ic", mode = { "x", "o" }, function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end, desc = "Select Inner Class" },

            { "]m", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, desc = "Next Function Start" },
            { "]]", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, desc = "Next Class Start" },
            { "]M", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, desc = "Next Function End" },
            { "][", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, desc = "Next Class End" },
            { "[m", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, desc = "Previous Function Start" },
            { "[[", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, desc = "Previous Class Start" },
            { "[M", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, desc = "Previous Function End" },
            { "[]", mode = { "n", "x", "o" }, function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, desc = "Previous Class End" },
        },
    },

    -- Context at top of screen
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            max_lines = 3,
        },
    },

    -- Additional text object plugins
    "echasnovski/mini.ai",
    "wellle/targets.vim",
    {
        "chrisgrieser/nvim-various-textobjs",
        event = "VeryLazy",
        opts = {
            keymaps = {
                useDefaults = true,
            },
        },
    },
}
