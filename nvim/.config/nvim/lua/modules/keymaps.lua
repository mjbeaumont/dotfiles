local set_km = require('modules/utils')

--Remap space as leader key
set_km("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- s + any two keys to jump around document
set_km("n", "s", "<Plug>(easymotion-s2)", { noremap = false })

set_km("n", "<Leader>hl", ":TSHighlightCapturesUnderCursor<CR>")

-- shortcut to jump to beginning/end of line
set_km("n", "H", "^")
set_km("n", "L", "$")

set_km("n", "<C-j>", ":bprev<CR>")
set_km("n", "<C-k>", ":bnext<CR>")

set_km("n", "<Leader>p", "_dP")
set_km("n", "<Leader>sv", ":lua ReloadConfig()<CR>")

-- easy move selected text
set_km("v", "J", ":m '>+1<CR>gv=gv")
set_km("v", "K", ":m '<-2<CR>gv=gv")

set_km("n", "<C-n>", ":lua ToggleNumber()<CR>")

set_km("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
set_km("n", "<Leader>fp", ":Telescope projects<CR>")
set_km("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
set_km("n", "<Leader>fs", ":lua require('telescope.builtin').treesitter()<CR>")
set_km("n", "<Leader>fo", ":lua require('telescope.builtin').buffers()<CR>")

set_km("n", "<Leader>gs", ":lua require('telescope.builtin').git_status()<CR>")
set_km("n", "<Leader>gc", ":lua require('telescope.builtin').git_bcommits()<CR>")
set_km("n", "<Leader>gb", ":lua require('telescope.builtin').git_branches()<CR>")

set_km("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
set_km("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
set_km("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
set_km("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

set_km("n", "<Leader>a", ":Alpha<CR>")
set_km("n", "<Leader>b", ":NvimTreeToggle<CR>")
set_km("n", "<Leader>gg", ":LazyGit<CR>")


set_km("n", "<Leader>w", ":Bdelete<CR>")
set_km("n", "<Leader>kw", ":bufdo :Bdelete<CR>")
set_km("n", "<Leader>q", ":qa!<CR>")
set_km("n", "<Leader>s", ":wa!<CR>")

set_km("n", "c*", "/<C-R>=expand('<cword>')<CR>/C<CR>``cgn")
set_km("n", "c#", "/<C-R>=expand('<cword>')<CR>/C<CR>``cgN")
