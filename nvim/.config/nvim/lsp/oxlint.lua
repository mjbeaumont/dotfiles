local capabilities = require("core/lsp/capabilities")

return {
    cmd = { "oxlint", "--lsp" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = function(fname)
        local dir = vim.fn.fnamemodify(fname, ":p:h")
        return vim.fs.find(
            { "oxlint.json", ".oxlintrc", ".oxlintrc.json", "package.json", ".git" },
            { upward = true, path = dir }
        )[1]
    end,
    capabilities = capabilities,
}
