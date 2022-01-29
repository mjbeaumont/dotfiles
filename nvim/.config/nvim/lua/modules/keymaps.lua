local set_km = require('modules/utils')

set_km("n", "s", "<Plug>(easymotion-s2)", { noremap = false })

set_km("n", "<Leader>hl", ":TSHighlightCapturesUnderCursor")
set_km("n", "H", "^")
set_km("n", "L", "$")

set_km("n", "<Leader>p", "_dP")
set_km("n", "<Leader>sv", ":source $MYVIMRC")

set_km("v", "J", ":m '>+1<CR>gv=gv")
set_km("v", "K", ":m '<-2<CR>gv=gv")

set_km("n", "<C-n>", "NumberToggle")

set_km("n", "<Leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
set_km("n", "<Leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
set_km("n", "<Leader>fs", ":lua require('telescope.builtin').treesitter()<CR>")
set_km("n", "<Leader>gs", ":lua require('telescope.builtin').git_status()<CR>")
set_km("n", "<Leader>gc", ":lua require('telescope.builtin').git_bcommits()<CR>")
set_km("n", "<Leader>gb", ":lua require('telescope.builtin').git_branches()<CR>")

set_km("n", "a", ":Alpha<CR>")
set_km("n", "b", ":NvimTreeToggle<CR>")


set_km("n", "<Leader>w", "Bdelete<CR>")
set_km("n", "<Leader>kw", ":bufdo :Bdelete<CR>")
set_km("n", "<Leader>q", ":qa!<CR>")
set_km("n", "<Leader>s", ":wa!<CR>")
