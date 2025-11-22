local capabilities = require("core/lsp/capabilities")
local utils = require("core/lsp/utils")

return {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = function(fname)
        local dir = vim.fn.fnamemodify(fname, ":p:h")
        return vim.fs.find(
            { ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", "package.json", ".git" },
            { upward = true, path = dir }
        )[1]
    end,
    capabilities = capabilities,
    on_init = function(client)
        vim.api.nvim_create_user_command("EslintFixAll", function()
            utils.eslint_fix_all({ client = client, sync = true })
        end, {})
    end,
}
