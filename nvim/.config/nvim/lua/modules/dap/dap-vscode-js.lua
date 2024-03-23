local status_ok, dap_vscode_js = pcall(require, "dap-vscode-js")
if not status_ok then
    return
end

dap_vscode_js.setup({
    adapters = { "pwa-node", "pwa-chrome",  "node-terminal", },
    -- log_file_path = '/Users/matthewbeaumont/log/',
    log_file_level = 0,
})
