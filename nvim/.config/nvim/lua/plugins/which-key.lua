return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 750
    end,
    opts = {
        delay = 750,
        spec = {
            -- snacks.lua, bufferline.lua, debug.lua
            { "<leader>b", group = "Buffer" },
            -- debug.lua
            { "<leader>d", group = "Debug" },
            -- snacks.lua
            { "<leader>f", group = "Find" },
            -- snacks.lua, git.lua, lsp.lua
            { "<leader>g", group = "Git" },
            -- vim-test.lua
            { "<leader>t", group = "Test" },
        },
    },
}
