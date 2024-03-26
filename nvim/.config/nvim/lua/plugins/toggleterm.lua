return {
    {
        -- amongst your other plugins
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            opts = { direction = "float" },
            config = true,
            keys = {
                { "<Leader>oh", ":TermExec cmd=htop<CR>", desc = "Open Htop", silent = true },
                { "<Leader>on", ":TermExec cmd=ts-node<CR>", desc = "Open TypeScript REPL", silent = true },
                { "<Leader>ot", ":ToggleTerm<CR>", desc = "Open Terminal", silent = true },
                { "<Leader>od", ":TermExec cmd=lazydocker<CR>", desc = "Open LazyDocker", silent = true },
            },
        },
    },
}
