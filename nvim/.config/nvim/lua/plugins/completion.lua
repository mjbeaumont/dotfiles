return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "L3MON4D3/LuaSnip",
        },
        version = "1.*",
        opts = {
            keymap = {
                preset = "default",
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-space>"] = { "show" },
                ["<C-e>"] = { "cancel", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            snippets = { preset = "luasnip" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            cmdline = {
                keymap = {
                    preset = "none",
                    ["<C-j>"] = { "select_next", "fallback" },
                    ["<C-k>"] = { "select_prev", "fallback" },
                    ["<C-space>"] = { "show" },
                    ["<C-e>"] = { "cancel", "fallback" },
                    ["<Tab>"] = { "accept", "fallback" },
                },
                completion = { menu = { auto_show = true } },
            },
            completion = {
                accept = {
                    auto_brackets = { enabled = false },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label", "label_description", gap = 1 },
                            { "kind" },
                        },
                    },
                },
            },
            signature = { enabled = true },
        },
    },
    -- Snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
        end,
    },
    "rafamadriz/friendly-snippets",
}
