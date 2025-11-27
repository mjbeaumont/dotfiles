return {
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local status_ok, gitsigns = pcall(require, "gitsigns")
            if not status_ok then
                return
            end

            gitsigns.setup({
                sign_priority = 100,
                current_line_blame = false, -- controlled manually
                current_line_blame_opts = {
                    delay = 200,
                    virt_text_pos = "eol",
                },
                current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            })

            -- Toggle blame based on diagnostics
            local blame_enabled = true
            local function update_blame()
                if not blame_enabled then return end
                local line = vim.fn.line(".") - 1
                local diagnostics = vim.diagnostic.get(0, { lnum = line })
                if #diagnostics > 0 then
                    gitsigns.toggle_current_line_blame(false)
                else
                    gitsigns.toggle_current_line_blame(true)
                end
            end

            vim.api.nvim_create_autocmd({ "CursorHold", "DiagnosticChanged" }, {
                callback = update_blame,
            })

            -- Expose toggle that respects our logic
            vim.api.nvim_create_user_command("GitBlameToggle", function()
                blame_enabled = not blame_enabled
                if not blame_enabled then
                    gitsigns.toggle_current_line_blame(false)
                else
                    update_blame()
                end
            end, {})
        end,
        keys = {
            { "<Leader>gbt", ":GitBlameToggle<CR>", desc = "Toggle Line Blame", silent = true },
        },
    },
    {
        "pwntester/octo.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        picker = "snacks",
        config = function()
            require("octo").setup({ suppress_missing_scope = {
                project_v2 = true,
            } })
        end,
        cmd = "Octo",
        keys = {
            {
                "<Leader>gm",
                ":Octo search is:pr is:open author:@me archived:false<CR>",
                desc = "Open My PRs",
            },
            {
                "<Leader>gc",
                ":Octo search is:pr is:open commenter:@me archived:false<CR>",
                desc = "Open PR Discussions",
            },
        },
    },
}
