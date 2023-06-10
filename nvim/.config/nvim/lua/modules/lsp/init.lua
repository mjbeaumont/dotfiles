local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("mason").setup()
require("mason-lspconfig").setup()
require("modules.lsp.handlers").setup()

local opts = {
    on_attach = require("modules.lsp.handlers").on_attach,
    capabilities = require("modules.lsp.handlers").capabilities,
}

lspconfig.eslint.setup(
  require("modules.lsp.tsserver").getOpts(opts.on_attach, opts.capabilities)
)
lspconfig.tsserver.setup(
  require("modules.lsp.eslint").getOpts(opts.on_attach, opts.capabilities)
)
lspconfig.lua_ls.setup(
  require("modules.lsp.lua_ls").getOpts()
)


