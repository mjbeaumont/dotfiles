local capabilities = require("core/lsp/capabilities")

return {
    settings = {
        pylsp = {
            plugins = {
                pyflakes = { enabled = true },
                pylint = { enabled = true },
                black = { enabled = true },
                isort = { enabled = true },
                jedi = { enabled = true },
            },
        },
    },
    capabilities = capabilities,
}
