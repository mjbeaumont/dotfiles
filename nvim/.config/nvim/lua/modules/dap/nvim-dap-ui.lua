local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    return
end

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({ reset = true })
end

dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

local set_km = require("modules/utils")

set_km("n", "<Leader>du", ":lua require('dapui').toggle()<CR>")
