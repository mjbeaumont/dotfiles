vim.cmd('autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab')

-- nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
-- nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

require "modules/functions"
require "modules/keymaps"
require "modules/options"
require "modules/plugins"
require "modules/treesitter"
require "modules/github_theme"
require "modules/telescope"
require "modules/bufferline"
require "modules/alpha"
require "modules/projects"
require "modules/lsp"
require "modules/nvim-cmp"
require "modules/nvim-tree"
require "modules/gitlinker"
