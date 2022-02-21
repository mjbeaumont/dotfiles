require "modules/functions"
require "modules/keymaps"
require "modules/options"
require "modules/plugins"
require "modules/treesitter"
require "modules/telescope"
require "modules/bufferline"
require "modules/alpha"
-- require "modules/projects"
require "modules/lsp"
require "modules/nvim-cmp"
require "modules/nvim-tree"
require "modules/gitlinker"
require "modules/git-blame"
require "modules/colortheme"
require "modules/octo"
require "modules/vim-test"
require "modules/floaterm"


vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
vim.cmd [[autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab]]
