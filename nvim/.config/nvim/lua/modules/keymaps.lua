local set_km = require("modules/utils")

--Remap space as leader key
set_km("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- s + any two keys to jump around document
-- set_km("n", "s", "<Plug>(easymotion-s2)", { noremap = false })

set_km("n", "Q", "<Nop>")

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

set_km("v", ">", ">gv")
set_km("v", "<", "<gv")

-- easy resize windows
set_km("n", "<C-Up>", ":resize -2<CR>")
set_km("n", "<C-Down>", ":resize +2<CR>")
set_km("n", "<C-Left>", ":vertical resize -2<CR>")
set_km("n", "<C-Right>", ":vertical resize +2<CR>")

set_km("n", "<C-n>", ":lua ToggleNumber()<CR>")

set_km("n", "<Leader>a", ":Alpha<CR>")
set_km("n", "<Leader>b", ":NvimTreeToggle<CR>")
set_km("n", "<Leader>gg", ":LazyGit<CR>")
set_km("n", "s", "<Plug>Lightspeed_omni_s", { noremap = false })

set_km("n", "<Leader>w", ":Bdelete<CR>")
set_km("n", "<Leader>kw", ":bufdo :Bdelete<CR>")
set_km("n", "<Leader>q", ":qa!<CR>")
set_km("n", "<Leader>s", ":wa!<CR>")

set_km("n", "c*", "/<C-R>=expand('<cword>')<CR>/C<CR>``cgn")
set_km("n", "c#", "/<C-R>=expand('<cword>')<CR>/C<CR>``cgN")

set_km("n", "<Leader>h", "<C-w><C-h>")
set_km("n", "<Leader>j", "<C-w><C-j>")
set_km("n", "<Leader>k", "<C-w><C-k>")
set_km("n", "<Leader>l", "<C-w><C-l>")

set_km("t", "<C-o>", "<C-\\><C-n>")
