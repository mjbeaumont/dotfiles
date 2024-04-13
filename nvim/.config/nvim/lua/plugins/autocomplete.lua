return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            -- nvim-cmp setup
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
                return
            end

            local snip_status_ok, luasnip = pcall(require, "luasnip")
            if not snip_status_ok then
                return
            end

            require("luasnip/loaders/from_vscode").lazy_load()

            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local cmp_kinds = {
                Text = "  ",
                Method = "  ",
                Function = "  ",
                Constructor = "  ",
                Field = "  ",
                Variable = "  ",
                Class = "  ",
                Interface = "  ",
                Module = "  ",
                Property = "  ",
                Unit = "  ",
                Value = "  ",
                Enum = "  ",
                Keyword = "  ",
                Snippet = "  ",
                Color = "  ",
                File = "  ",
                Reference = "  ",
                Folder = "  ",
                EnumMember = "  ",
                Constant = "  ",
                Struct = "  ",
                Event = "  ",
                Operator = "  ",
                TypeParameter = "  ",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-u>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                formatting = {
                    fields = { "abbr", "kind" },
                    format = function(_, vim_item)
                        -- Kind icons
                        vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
                        return vim_item
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "nvim_lsp_signature_help" },
                }, {
                    { name = "buffer", keyword_length = 5 },
                }),
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                experimental = {
                    ghost_text = false,
                    native_menu = false,
                },
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(
                { ":" },
                { mapping = cmp.mapping.preset.cmdline(), sources = {{ name = "cmdline" }, { name = "path" }} }
            )
        end,
    }, -- Autocompletion plugin
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path", -- add filesystem path completion
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp-signature-help",
}
