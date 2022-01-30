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
nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

set clipboard=unnamedplus

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as' : 'vsc-easymotion'})
  Plug 'justinmk/vim-sneak'
  Plug 'sheerun/vim-polyglot'
  Plug 'kana/vim-textobj-user'
  Plug 'othree/xml.vim'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'wellle/targets.vim'
call plug#end()
" Better Navigation

nmap s <Plug>(easymotion-s2)

map <C-J> :bprev<CR>
map <C-K> :bnext<CR>

nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

nnoremap H ^
nnoremap L $

vnoremap <Leader>p "_dP

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-n> :call NumberToggle()<CR>

set ignorecase
set smartcase
set timeoutlen=1000 ttimeoutlen=0
