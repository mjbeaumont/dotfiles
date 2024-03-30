return {
    {
        "mhartington/formatter.nvim",
        lazy = false,
        config = function()
            local status_ok, formatter = pcall(require, "formatter")
            if not status_ok then
                return
            end

            formatter.setup({
                filetype = {
                    css = {
                        -- prettier
                        function()
                            return {
                                exe = "prettier",
                                args = {
                                    "--stdin-filepath",
                                    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                                    "--single-quote",
                                },
                                stdin = true,
                            }
                        end,
                    },
                    lua = {
                        function()
                            return {
                                exe = "stylua",
                                args = {
                                    "--config-path " .. os.getenv("HOME") .. "/.config/nvim/stylua.toml",
                                    "-",
                                },
                                stdin = true,
                            }
                        end,
                    },
                    rust = {
                        function()
                            return {
                                exe = "rustfmt",
                                args = { "--edition 2021" },
                                stdin = true,
                            }
                        end,
                    },
                },
            })
        end,
        keys = {
            {
                "<C-l>",
                ":FormatWrite<CR>",
                silent = true,
            },
        },
    },
}
