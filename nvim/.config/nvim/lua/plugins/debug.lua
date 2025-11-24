return {
    -- Debugging
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "DAP: Continue",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "DAP: Step Over",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "DAP: Step Into",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                desc = "DAP: Step Out",
            },
            {
                "<Leader>b",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "DAP: Toggle Breakpoint",
            },
            {
                "<Leader>B",
                function()
                    require("dap").set_breakpoint()
                end,
                desc = "DAP: Set Breakpoint",
            },
            {
                "<Leader>dr",
                function()
                    require("dap").repl.open()
                end,
                desc = "DAP: Open REPL",
            },
            {
                "<Leader>dl",
                function()
                    require("dap").run_last()
                end,
                desc = "DAP: Run Last",
            },
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "js-debug-adapter" },
                automatic_installation = true,
            })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    },
}
