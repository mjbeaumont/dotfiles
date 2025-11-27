return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        styles = {
            notification = {
                wo = {
                    wrap = true,
                },
            },
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        explorer = {
            enabled = true,
        },
        gitbrowse = { enabled = true },
        image = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        lazygit = { enabled = true, configure = true },
        picker = {
            hidden = true,
            ui_select = true,
            sources = { explorer = { hidden = true }, files = { hidden = true } },
            win = { list = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } }, ["<c-h>"] = "explorer_up" } } },
        },
        notifier = { enabled = true, style = "fancy" },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            "<Leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Open Files",
        },
        {
            "<Leader>fo",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Find Open Files",
        },
        {
            "<Leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<Leader>fg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Live Grep",
        },
        {
            "<Leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent",
        },
        {
            "<Leader>fd",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>fn",
            function()
                Snacks.picker.notifications()
            end,
            desc = "Show Notifications",
        },
        {
            "<leader>gg",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>gy",
            function()
                Snacks.gitbrowse.open({
                    open = function(url)
                        vim.fn.setreg("+", url)
                        Snacks.notifier("Yanked URL to clipboard:" .. url, vim.log.levels.INFO)
                    end,
                })
            end,
            desc = "Yank link to remote git repo",
        },
        {
            "<leader>go",
            function()
              Snacks.gitbrowse()
            end,
            desc = "Open file/line on Github"
        },
        {
            "<leader>gp",
            function()
                Snacks.picker.gh_pr()
            end,
            desc = "View Pull Requests",
        },
        {
            "<leader>bf",
            function()
                Snacks.explorer()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>gb",
            function()
                Snacks.git.blame_line()
            end,
            desc = "Git Blame Line",
        },
        {
            "<leader>gB",
            function()
                Snacks.picker.git_log_line()
            end,
            desc = "Git Log for Line",
        },
        {
            "<leader>gbo",
            function()
                local file = vim.fn.expand("%")
                local line = vim.fn.line(".")
                local cmd = string.format("git blame -L %d,%d --porcelain %s | head -1 | cut -d' ' -f1", line, line, file)
                local commit = vim.fn.system(cmd):gsub("%s+", "")
                if commit and commit ~= "" and not commit:match("^0+$") then
                    local remote_url = vim.fn.system("git remote get-url origin"):gsub("%s+", "")
                    local repo = remote_url:match("github.com[:/](.+)%.git")
                    if repo then
                        local url = string.format("https://github.com/%s/commit/%s", repo, commit)
                        vim.ui.open(url)
                    end
                else
                    vim.notify("Line not yet committed", vim.log.levels.WARN)
                end
            end,
            desc = "Open Commit URL for Line",
        },
    },
}
