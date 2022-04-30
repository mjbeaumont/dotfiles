local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    return
end

dapui.setup()

local set_km = require("modules/utils")

set_km("n", "<Leader>du", ":lua require('dapui').toggle()<CR>")
