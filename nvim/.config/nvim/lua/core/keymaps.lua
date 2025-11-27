local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "Q", "<Nop>")

-- Center cursor after jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Join lines without cursor moving
map("n", "J", "mzJ`z")

-- shortcut to jump to beginning/end of line
map({"n", "v", "o"}, "H", "^")
map({"n", "v", "o"}, "L", "$")

map("n", "<C-j>", ":bprev<CR>")
map("n", "<C-k>", ":bnext<CR>")

-- Visual paste without overwriting register
-- (uses whatever register you specify, e.g., p, "+p, "0p all work)
map("v", "p", function()
    return '"_d"' .. vim.v.register .. 'P'
end, { expr = true })
map("n", "<Leader>sv", ":lua ReloadConfig()<CR>")

-- easy move selected text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("v", ">", ">gv")
map("v", "<", "<gv")

-- easy resize windows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

map("n", "<C-n>", ":lua ToggleNumber()<CR>")
map("n", "yp", ":let @*=expand('%')<CR>")

map("n", "<Leader>w", ":Bdelete<CR>")
map("n", "<Leader>kw", ":bufdo :Bdelete<CR>")
map("n", "<Leader>q", ":qa!<CR>")
map("n", "<Leader>s", ":wa!<CR>")

map("n", "c*", "/<C-R>=expand('<cword>')<CR>/C<CR>``cgn", { desc = "Change current word (repeatable forward)" })
map("n", "c#", "/<C-R>=expand('<cword>')<CR>/C<CR>``cgN", { desc = "Change current word (repeatable backward)" })

map("n", "<Leader>h", "<C-w><C-h>")
map("n", "<Leader>j", "<C-w><C-j>")
map("n", "<Leader>k", "<C-w><C-k>")
map("n", "<Leader>l", "<C-w><C-l>")

map("t", "<C-o>", "<C-\\><C-n>")
