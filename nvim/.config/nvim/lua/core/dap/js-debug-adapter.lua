local dap = require("dap")

-- Use the js-debug-adapter from mason
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"

dap.adapters["pwa-node"] = {
    type = "server",
    host = "127.0.0.1",
    port = 9229,
    executable = {
        command = "node",
        args = {
            mason_path .. "/js-debug/src/dapDebugServer.js",
            "9229",
        },
    },
}
dap.configurations.typescript = {
    {
        name = "Launch file",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        outFiles = { "${workspaceFolder}/dist/**/*.js" },
        runtimeArgs = {}, -- IMPORTANT: no --inspect
        resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
        },
    },
    {
        name = "Attach to process",
        type = "pwa-node",
        request = "attach",
        -- processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
    },
}

-- Also apply to JavaScript files
dap.configurations.javascript = dap.configurations.typescript
