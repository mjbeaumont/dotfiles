local capabilities = require("core/lsp/capabilities")

return {
    cmd = { "oxfmt", "--lsp" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = function(fname)
        local dir = vim.fn.fnamemodify(fname, ":p:h")
        return vim.fs.find(
            { ".oxfmtrc.json", "package.json", ".git" },
            { upward = true, path = dir }
        )[1]
    end,
    capabilities = capabilities,
}
