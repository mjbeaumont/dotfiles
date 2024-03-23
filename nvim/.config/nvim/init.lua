require("modules/autocommands")
require("modules/functions")
require("modules/keymaps")
require("modules/options")
require("lazy-plugins")
--require("modules/plugins")
require("modules/telescope")
-- require "modules/projects"
require("modules/lsp")
require("modules/nvim-cmp")
require("modules/mini-files")
require("modules/gitlinker")
require("modules/git-blame")
require("modules/colortheme")
require("modules/octo")
require("modules/vim-test")
require("modules/indent-blankline")
require("modules/nvim-treehopper")
require("modules/formatter")
require("modules/dap")
require("modules/nvim-trouble")

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
vim.cmd([[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]])
