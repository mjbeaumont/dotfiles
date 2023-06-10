local dap = require("dap")

dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/dapinstall/jsnode/" .. "vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/dapinstall/chrome/" .. "vscode-chrome-debug/out/src/chromeDebug.js" },
}

local attachConfig = {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = "Attach to process",
    type = "node2",
    request = "attach",
    processId = require("dap.utils").pick_process,
}

local chromeAttachConfig = {
    name = "Attach to Chrome",
    type = "chrome",
    program = "${file}",
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
}

dap.configurations.javascript = {
    attachConfig,
}

dap.configurations.typescript = {
    attachConfig,
}

dap.configurations.javascriptreact = {
    chromeAttachConfig,
}

dap.configurations.typescriptreact = {
    chromeAttachConfig,
}

local set_km = require("modules/utils")

set_km("n", "<Leader>dc", ":lua require('dap').continue()<CR>")
set_km("n", "<Leader>dt", ":lua require('dap').toggle_breakpoint()<CR>")
set_km("n", "<Leader>di", ":lua require('dap').step_into({ askForTargets = true })<CR>")
set_km("n", "<Leader>do", ":lua require('dap').step_over()<CR>")
set_km("n", "<Leader>db", ":lua require('dap').step_back()<CR>")
