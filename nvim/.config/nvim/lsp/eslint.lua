local capabilities = require("core/lsp/capabilities")

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
}
