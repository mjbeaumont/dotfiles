local ts_utils_settings = {
    -- debug = true,
    import_all_scan_buffers = 100,
    update_imports_on_move = true,
    always_organize_imports = false,
    auto_inlay_hints = false,
    -- filter out dumb module warning
    filter_out_diagnostics_by_code = { 80001 },
}

local M = {}
M.getOpts = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")
    local ts_utils = require("nvim-lsp-ts-utils")

    return {
        root_dir = lspconfig.util.root_pattern("package.json"),
        init_options = ts_utils.init_options,
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        },
        on_attach = function(client, bufnr)
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false

            on_attach(client, bufnr)

            ts_utils.setup(ts_utils_settings)
            ts_utils.setup_client(client)
        end,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return M
