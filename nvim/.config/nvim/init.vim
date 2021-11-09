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

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as' : 'vsc-easymotion'})
  Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
  Plug 'gerw/vim-HiLinkTrace'
  Plug 'justinmk/vim-sneak'
  Plug 'kana/vim-textobj-user'
  Plug 'othree/xml.vim'
  Plug 'rakr/vim-one', Cond(!exists('g:vscode'))
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/argtextobj.vim'
  Plug 'w0rp/ale'
  Plug 'wellle/targets.vim'
call plug#end()
" Better Navigation

if exists('g:vscode')
    nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>
    set clipboard=unnamedplus
else
    nnoremap <C-n> :call NumberToggle()<CR>
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
    colorscheme one
    " Airline
    " let g:airline_theme = "palenight"
    let g:palenight_terminal_italics=1

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let g:ale_linters = {
      \   'javascript': ['eslint'],
    \}
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif 

nmap s <Plug>(easymotion-s2)

map <C-J> :bprev<CR>
map <C-K> :bnext<CR>

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

nnoremap H ^
nnoremap L $

vnoremap <Leader>p "_dP
nnoremap <Leader>sv :source $MYVIMRC<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


set ignorecase
set smartcase
