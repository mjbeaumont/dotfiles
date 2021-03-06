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
                    args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote" },
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
    },
})

local set_km = require("modules.utils")
set_km("n", "<C-l>", ":FormatWrite<CR>")
