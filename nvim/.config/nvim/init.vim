function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

let mapleader="\<Space>"

if exists('g:vscode')
    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>
    set clipboard=unnamedplus
else
    set relativenumber
    set tabstop=8
    set expandtab
    set shiftwidth=4  
    set autoindent   
    set smartindent 
    set hidden
    set termguicolors
    set background=dark
    set nohlsearch
    set undodir=~/.vim/undodir
    
    syntax on
    colorscheme nightfox

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif 

nmap s <Plug>(easymotion-s2)

map <C-J> :bprev<CR>
map <C-K> :bnext<CR>

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

nnoremap <Leader>hl :TSHighlightCapturesUnderCursor<CR>

nnoremap H ^
nnoremap L $

vnoremap <Leader>p "_dP
nnoremap <Leader>sv :source $MYVIMRC<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-n> :call NumberToggle()<CR>

nnoremap Q @q
set ignorecase
set smartcase
set timeoutlen=1000 ttimeoutlen=0

:lua require "modules/plugins"
:lua require "modules/treesitter"
" :lua require "modules/github-theme"
:lua require "modules/nightfox"
