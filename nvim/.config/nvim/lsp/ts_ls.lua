local helpers = require("core/lsp/utils")
local capabilities = require("core/lsp/capabilities")
local tsdk = helpers.get_tsdk()

return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_dir = function(fname)
        local dir = vim.fn.fnamemodify(fname, ":p:h")
        return vim.fs.find({ "package.json", "tsconfig.json", ".git" }, { upward = true, path = dir })[1]
    end,
    init_options = {
        hostInfo = "neovim",
        tsserver = { tsdk = tsdk },
    },
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
}
