require("autocommands")
require("functions")
require("keymaps")
require("options")
require("lazy_nvim")
require("modules/dap")

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
vim.cmd([[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]])
